import 'package:flutter/material.dart';
import 'package:valorant_wiki/config/design.dart';
import 'package:valorant_wiki/pages/home_page.dart';
import 'package:valorant_wiki/pages/landing_page.dart';
import 'package:valorant_wiki/pages/list_page.dart';
import 'package:valorant_wiki/pages/main_page.dart';


void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Valorant Wiki",
        theme: ThemeData(
          scaffoldBackgroundColor: DesignSystem.vmblue,
          primaryColor: DesignSystem.vred,
          fontFamily: 'inter'
        ),
        home: const LandingPage());
  }
}
