import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position _position = await getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      this.latitude = _position.latitude;
      this.longitude = _position.longitude;
    } catch (exception) {
      print(exception);
    }
  }

  @override
  String toString() {
    return 'Instance of \'Location\': { latitude: ${this.latitude}, longitude: ${this.longitude} }';
  }
}
