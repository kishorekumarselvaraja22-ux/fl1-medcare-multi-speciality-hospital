// Generated on 2026-06-04 15:44:20.255
// SEO Page Title: My Dynamic Website
// SEO Meta Description: Create responsive web layouts visually.
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Dynamic Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const BuiltWebsiteHomePage(),
    );
  }
}