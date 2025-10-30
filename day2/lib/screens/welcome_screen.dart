import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav_bar.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),  // Light gray bg
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),  // Exact mockup padding
          child: Column(
            children: [
              // Top Navigation: Skip + Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},  // UI only—no action
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color(0xFF4CAF50),  // Primary green
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},  // Search/QR? Use your custom if available
                        icon: Icon(Icons.search, color: Colors.grey[600], size: 24),
                      ),
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {},  // Notifications
                            icon: Icon(Icons.notifications_outlined, color: Colors.grey[600], size: 24),
                          ),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),  // Red dot for unread
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // Header Content (Centered Logo + Title)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo: Mountain/Plane Icon in Rounded White Container
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),  // Rounded as in mockup
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},  // No action
                        icon: Image.asset(
                          'assets/icons/plane_mountain.png',  // Add your custom logo icon here
                          width: 40,
                          height: 40,
                          color: const Color(0xFF4CAF50),
                          errorBuilder: (context, error, stackTrace) => 
                              const Icon(Icons.flight_land, color: Color(0xFF4CAF50), size: 40),  // Fallback
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),  // Vertical spacing
                    // "Welcome to" Subtitle
                    Text(
                      'Welcome to',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    // "Waypath" Main Title (Bold Green)
                    Text(
                      'Waypath',
                      style: GoogleFonts.poppins(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF4CAF50),
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 80),  // Placeholder space for illustration (Day 3)
                    const Text(
                      'Coming Soon: Illustration, Description & Buttons',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              // Bottom Nav (From Day 1)
              const BottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}