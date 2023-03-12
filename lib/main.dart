import 'package:flutter/material.dart';
import 'package:providers_latihan/core/di/di.dart';
import 'app.dart';

void main() async{
  // Register the Dependency Injection
  await registerDependencies();
  runApp(MyApp());
}
