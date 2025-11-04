import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/trip_detail_screen.dart';  // Import the trip detail screen
import 'screens/destination_screen.dart';
import 'screens/vacation_detail_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waypath Trip Details',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
       // home: const TripDetailScreen(),  // Changed to TripDetailScreen
      // home:const DestinationScreen(),
      //  home: const VacationDetailScreen(),
       home:const WelcomeScreen(),

    );
  }
}