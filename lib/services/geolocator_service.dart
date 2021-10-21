import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kawal_desa2/models/user_location.dart';

class GeolocatorService{
  final Geolocator _geolocator = Geolocator();

  Future<UserLocation> getCurrentLocation() async {
    try {
      var addressLine = '';
      final Position position = await _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );
      final Coordinates coordinates =
      Coordinates(position.longitude, position.longitude);
      final address =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);

      if (position.mocked) {
        addressLine = address.first.addressLine + '#FakeLocation';
      } else {
        addressLine = address.first.addressLine;
      }

      UserLocation userLocation = UserLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        addressLine: addressLine,
      );
      return userLocation;
    }
    catch(e){
      return null;
    }
  }
}