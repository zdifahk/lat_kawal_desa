import 'package:flutter/material.dart';
import 'package:kawal_desa2/services/navigation_service.dart';
import 'package:kawal_desa2/ui/locator.dart';
import 'package:kawal_desa2/ui/router.dart';
import 'package:kawal_desa2/ui/views/login_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: LoginView(),
      onGenerateRoute: generateRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
    );
  }
}
