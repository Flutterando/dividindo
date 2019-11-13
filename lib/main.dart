import 'package:flutter/material.dart';
import 'package:dividindo/app/app_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  final sharedPreference = await SharedPreferences.getInstance();

  return runApp(AppModule(sharedPreference));
}