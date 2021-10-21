import 'package:get_it/get_it.dart';
import 'package:kawal_desa2/services/api_service.dart';
import 'package:kawal_desa2/services/geolocator_service.dart';
import 'package:kawal_desa2/services/location_service.dart';
import 'package:kawal_desa2/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => GeolocatorService());
  locator.registerLazySingleton(() => LocationService());
}