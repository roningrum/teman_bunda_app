import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teman_bunda_app/splash_screen.dart';
import 'package:teman_bunda_app/teman_bunda_app.dart';
import 'package:teman_bunda_app/term-condition.dart';
import 'package:teman_bunda_app/theme/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: pinkBold,
    ),
  );
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
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}