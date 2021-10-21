import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kawal_desa2/constants/route_name.dart';
import 'package:kawal_desa2/services/api_service.dart';
import 'package:kawal_desa2/services/geolocator_service.dart';
import 'package:kawal_desa2/services/location_service.dart';
import 'package:kawal_desa2/services/navigation_service.dart';
import 'package:kawal_desa2/ui/locator.dart';
import 'package:kawal_desa2/viewmodels/base_model.dart';
import 'package:latlong/latlong.dart';

class SignUpViewModel extends BaseModel {
  String unitSelected;
  String company;
  String imagePath = "";
  String imagePathKk = "";
  String imagePathProfile = "";

  double lat = 0.0;
  double long = 0.0;

  List<String> units = List();
  List<Marker> myPoint = [];

  final ApiService _apiService = locator<ApiService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final LocationService _locationService = locator<LocationService>();
  final GeolocatorService _geolocatorService = locator<GeolocatorService>();

  TextEditingController addressController = TextEditingController();

  void onUnitChangeSelect(String value) {
    unitSelected = value;
    setBusy(false);
  }

  bool changeVisibility() {
    if (units == null || units.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void getCompanyUnit(String code) async {
    setBusy(false);
    units.clear();
    unitSelected = null;
    final unit = await _apiService.getCompanyUnit(code);
    if (unit != null) {
      unit.data.forEach((value) {
        units.add(value);
      });
    }
    setBusy(false);
  }

  Future<void> cameraView(String type) async {
    setBusy(true);
    final path = await _navigationService.navigateTo(CameraViewRoute);
    if (type == "KTP") {
      imagePath = path.toString().split('#')[0];
    } else if (type == "KK") {
      imagePathKk = path.toString().split('#')[0];
    } else if (type == "Profile") {
      imagePathProfile = path.toString().split('#')[0];
    }
  }

  bool isPathNull(String type) {
    if (type == "KTP") {
      if (imagePath == null || imagePath.isEmpty) {
        return false;
      } else if (type == "KK" || imagePathKk.isEmpty) {
        return false;
      } else if (type == "Profile" || imagePathProfile.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void handleTap(LatLng latLng){
    setBusy(true);
    lat = latLng.latitude;
    long = latLng.longitude;
    myPoint.clear();
    myPoint.add(Marker(
      width:80.0,
      height:80.0,
      point:latLng,
      builder: (ctx) => Container(
        child: Icon(Icons.location_on),
      )
    ));
    setBusy(false);
  }

  void openLocationSetting() async {
    await _locationService.checkService();
  }

  Future<void> getLocation() async {
    setBusy(true);
    try{
      myPoint.clear();
      final userLocation = await _geolocatorService.getCurrentLocation();
      lat = userLocation.latitude;
      long = userLocation.longitude;

      myPoint.add(Marker(
          width:80.0,
          height:80.0,
          point:LatLng(lat,long),
          builder: (ctx) => Container(
            child: Icon(Icons.location_on),
          )
      ));
      setBusy(false);
    } catch (e){
      setBusy(false);
    }
  }

  void initState() async {
    setBusy(true);
    await openLocationSetting();
    await getLocation();
    setBusy(false);
  }
}