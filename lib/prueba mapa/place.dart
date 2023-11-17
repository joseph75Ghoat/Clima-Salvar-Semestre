
class Place {
  final String name;
  final double temperature;
  final double latitude;
  final double longitude;

  Place({
    required this.name,
    required this.temperature,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'temperature': temperature,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}