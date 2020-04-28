import 'package:geolocator/geolocator.dart';

class Location {
  Geolocator _geolocator;
  Position _lastPosition;
  double get latitude => _lastPosition.latitude;
  double get longitude => _lastPosition.longitude;
  Location() {
    this._geolocator = Geolocator();
    this.updateCurrentPosition();
  }

  Future<void> updateCurrentPosition() async {
    try {
      _lastPosition = await this
          ._geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print(e);
    }
  }
}
