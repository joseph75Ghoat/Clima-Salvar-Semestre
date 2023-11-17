
// import 'package:flutter/material.dart';
// import 'database_helper.dart';
// import 'place.dart';

// class SavedPlacesScreen extends StatefulWidget {
//   @override
//   _SavedPlacesScreenState createState() => _SavedPlacesScreenState();
// }

// class _SavedPlacesScreenState extends State<SavedPlacesScreen> {
//   DatabaseHelper _databaseHelper = DatabaseHelper();
//   List<Place> _places = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchPlaces();
//   }

//   Future<void> _fetchPlaces() async {
//     final places = await _databaseHelper.getPlaces();
//     setState(() {
//       _places = places;
//     });
//   }

//   Future<void> _deletePlace(int index) async {
//     await _databaseHelper.deletePlace(_places[index]);
//     _fetchPlaces();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Temperaturas Guardadas'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.purple, Colors.lightBlueAccent, Colors.black54],
//           ),
//         ),
//         child: _places.isEmpty
//             ? Center(
//                 child: Text(
//                   'No hay lugares y por lo tanto no hay temperatura',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: _places.length,
//                 itemBuilder: (context, index) {
//                   final place = _places[index];
//                   return Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     child: Card(
//                       elevation: 4,
//                       child: ListTile(
//                         title: Text(
//                           place.name,
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           'Temperature: ${place.temperature.toStringAsFixed(2)}°C',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(Icons.delete),
//                           onPressed: () async {
//                             await _deletePlace(index);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('${place.name} deleted'),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'place.dart';

class SavedPlacesScreen extends StatefulWidget {
  @override
  _SavedPlacesScreenState createState() => _SavedPlacesScreenState();
}

class _SavedPlacesScreenState extends State<SavedPlacesScreen> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Place> _places = [];

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  Future<void> _fetchPlaces() async {
    final places = await _databaseHelper.getPlaces();
    setState(() {
      _places = places;
    });
  }

  Future<void> _deletePlace(int index) async {
    await _databaseHelper.deletePlace(_places[index]);
    _fetchPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Temperaturas Guardadas',
          style: TextStyle(color: const Color.fromARGB(255, 255, 254, 254)),
        ),
        backgroundColor: Colors.black, // Cambiar a negro
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white), // Cambiar el color de los iconos a blanco
        centerTitle: true,
        actions: <Widget>[
          // Puedes agregar acciones en el lado derecho si lo necesitas
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.lightBlueAccent, Colors.black54],
          ),
        ),
        child: _places.isEmpty
            ? Center(
                child: Text(
                  'No hay lugares y por lo tanto no hay temperatura',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: _places.length,
                itemBuilder: (context, index) {
                  final place = _places[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Card(
                      elevation: 4,
                      color: Colors.purple.withOpacity(0.7), // Color transparente morado
                      child: ListTile(
                        title: Text(
                          place.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Temperature: ${place.temperature.toStringAsFixed(2)}°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await _deletePlace(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${place.name} deleted'),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

