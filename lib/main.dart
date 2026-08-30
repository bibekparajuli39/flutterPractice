import 'package:flutter/material.dart';

import 'package:practiceapp/screens/product_screen.dart';
import 'package:practiceapp/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my app",
      debugShowCheckedModeBanner: false,
      home: ProductScreen(ApiService()),
    );
  }
}
