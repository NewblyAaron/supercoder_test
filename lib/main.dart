import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercoder_test/app/routes/app_pages.dart';

void main() => runApp(
  GetMaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xff8130ef),
      colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff8130ef)),
    ),
    initialRoute: '/',
    getPages: Pages.routes,
  ),
);
