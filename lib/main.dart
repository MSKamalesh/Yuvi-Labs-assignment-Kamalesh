import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/bottom_nav_bar.dart';  // Relative import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waypath Day 1',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const DemoScaffold(),
    );
  }
}

class DemoScaffold extends StatelessWidget {
  const DemoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),  // Light gray bg for whole screen
      body: SafeArea(  // Ensures no overlap with system UI on mobile
        child: Stack(
          children: [
            // Main Content (Centered Demo Text)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),  // Space for nav bar height
                child: const Text(
                  'Bottom Nav Demo\n(Scroll to see icons)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Custom Bottom Nav (Positioned to bottom)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: const BottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}