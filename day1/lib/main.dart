import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/destination_screen.dart';  // Import the new screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waypath Destination Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const DestinationScreen(),
    );
  }
}