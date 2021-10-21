import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService{
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => navigationKey;

  void pop(){
    return _navigationKey.currentState.pop();
  }

  void popUpWithValue(String value){
    return _navigationKey.currentState.pop('$value');
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}){
    return _navigationKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToWithData(String routeName, data, {dynamic arguments}){
    return _navigationKey.currentState.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  Future<dynamic> replaceTo(String routeName,{dynamic arguments}){
    return _navigationKey.currentState.pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}