import 'package:flutter/material.dart';
import 'package:klimate/utils/route_strings.dart';
import 'package:klimate/views/home.dart';
import 'package:klimate/views/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
      routes:{
        weatherPageRoute:(context) => const WeatherPage(),
      },
    );
  }
}

