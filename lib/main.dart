import 'package:flutter/material.dart';
import 'package:transimed/ui/screens/home_screen.dart';
import 'package:transimed/ui/screens/loading_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat'
      ),
      home: const LoadingScreen(),
    );
  }
}
