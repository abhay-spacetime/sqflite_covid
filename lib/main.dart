import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sqlicrud_demo/screens/landingView/landing_page.dart';

import 'app_pages.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sqlite Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: pages,
      initialRoute: LandingPage.id,
    );
  }
}
