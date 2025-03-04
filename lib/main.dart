import 'package:flutter/material.dart';
import 'package:prayer/screen/edit_screen.dart';

import 'screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      routes: {
        'mainScreen': (context) => const MainScreen(),
        'editScreen': (context) => const EditScreen(),
      },
    );
  }
}