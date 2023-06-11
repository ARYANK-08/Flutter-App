import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 34, 89, 255)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}



