
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/provider/forecast_tile_provider.dart';
import 'package:weatherapp/prueba%20mapa/place.dart';
import 'package:weatherapp/prueba%20mapa/saved_places_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../prueba mapa/database_helper.dart';

void main() {
  runApp(MaterialApp(
    home: MapSample(),
  ));
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController? _controller;
  TileOverlay? _tileOverlay;
  DateTime _forecastDate = DateTime.now();
  DatabaseHelper _databaseHelper = DatabaseHelper();
  Set<Marker> _markers = {};
  String _selectedMapType = 'Normal'; // Valor predeterminado

  _initTiles(DateTime date) async {
    final String overlayId = date.millisecondsSinceEpoch.toString();
    final TileOverlay tileOverlay = TileOverlay(
      tileOverlayId: TileOverlayId(overlayId),
      tileProvider: ForecastTileProvider(
        dateTime: date,
        mapType: 'PR0',
        opacity: 0.4,
      ),
    );
    setState(() {
      _tileOverlay = tileOverlay;
    });
  }

  Future<double> _getTemperature(LatLng latLng) async {
    const apiKey = "182a9cc4b6e34f88948cba7d70e3bf20";
    final apiUrl = "https://api.openweathermap.org/data/2.5/weather";
    final response = await http.get(
      Uri.parse('$apiUrl?lat=${latLng.latitude}&lon=${latLng.longitude}&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final temperatureKelvin = data['main']['temp'];
      final temperatureCelsius = temperatureKelvin - 273.15;
      return temperatureCelsius.toDouble();
    } else {
      throw Exception('Failed to load temperature');
    }
  }

  _onMapTap(LatLng latLng) async {
    final name = await _showInputDialog('Enter Name');
    if (name != null) {
      final temperature = await _getTemperature(latLng);
      final place = Place(
        name: name,
        temperature: temperature,
        latitude: latLng.latitude,
        longitude: latLng.longitude,
      );
      await _databaseHelper.insertPlace(place);
      _fetchPlaces(); // Actualiza la lista de lugares y los marcadores después de guardar uno nuevo
    }
  }

  Future<void> _fetchPlaces() async {
    final places = await _databaseHelper.getPlaces();
    final markers = places.map((place) {
      return Marker(
        markerId: MarkerId(place.name),
        position: LatLng(place.latitude, place.longitude),
        infoWindow: InfoWindow(
          title: place.name,
          snippet: 'Temperature: ${place.temperature.toStringAsFixed(2)}°C',
        ),
      );
    }).toSet();

    setState(() {
      _markers = markers;
    });
  }

  Future<void> _deletePlace(int index) async {
    final places = await _databaseHelper.getPlaces();
    await _databaseHelper.deletePlace(places[index]);
    _fetchPlaces();
  }

  Future<String?> _showInputDialog(String title) async {
    String? result = '';
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            onChanged: (value) {
              result = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(result);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            onTap: _onMapTap,
            mapType: _getSelectedMapType(),
            initialCameraPosition: CameraPosition(
              target: LatLng(20.521800529591797, -100.81401662766905),
              zoom: 4,
            ),
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _controller = controller;
              });
              _initTiles(_forecastDate);
              _fetchPlaces(); // Carga los lugares al crear el mapa
            },
            tileOverlays:
                _tileOverlay == null ? {} : <TileOverlay>{_tileOverlay!},
            markers: _markers,
          ),
          Positioned(
            top: 30,
            right: 16,
            child: DropdownButton<String>(
              value: _selectedMapType,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: const Color.fromARGB(255, 33, 23, 23)),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMapType = newValue!;
                });
              },
              items: <String>['Normal', 'Terreno', 'Satelital', 'Híbrida']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Positioned(
            bottom: 30,
            child: Container(
              // ... (código existente)
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SavedPlacesScreen(),
            ),
          );
        },
        child: Icon(Icons.list),
      ),
    );
  }

  MapType _getSelectedMapType() {
    switch (_selectedMapType) {
      case 'Normal':
        return MapType.normal;
      case 'Terreno':
        return MapType.terrain;
      case 'Satelital':
        return MapType.satellite;
      case 'Híbrida':
        return MapType.hybrid;
      default:
        return MapType.normal;
    }
  }
}
