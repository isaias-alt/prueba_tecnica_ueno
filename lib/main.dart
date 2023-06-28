import 'package:flutter/material.dart';

import 'package:prueba_tecnica_ueno/pages/login_page.dart';
import 'package:prueba_tecnica_ueno/themes/app_theme.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Técnica UENO',
      theme: AppTheme(selectedColor: 0).theme(),
      home: const LoginPage(),
    );
  }
}
