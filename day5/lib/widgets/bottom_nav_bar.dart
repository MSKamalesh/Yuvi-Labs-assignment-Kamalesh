import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,  // Dark background for the bar
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),  // Rounded top corners
        ),
      ),
      padding: const EdgeInsets.only(
        top: 12.0,  // Internal top padding for rounded feel
        bottom: 24.0,  // Bottom padding to match mockup
        left: 10.0,
        right: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // Even spacing
        children: [
          Image.asset(
            'assets/icons/Home.png',
            width: 28,
            height: 28,
            color: Colors.white.withOpacity(0.7),  // Tint for inactive
            errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.home_outlined, color: Color(0xFFB0B0B0), size: 28),  // Fallback with gray
          ),
          Image.asset(
            'assets/icons/Calender.png',  // Note: Typo in filename? Should be Calendar.png
            width: 48,
            height: 48,
            color: Colors.white.withOpacity(0.7),
            errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.calendar_today_outlined, color: Color(0xFFB0B0B0), size: 28),
          ),
          // Yellow circle design for location icon (matching edited image: warmer gold, 0.8 opacity for subtle transparency)
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 59, 52, 0).withOpacity(0.8),  // Warmer gold yellow with adjusted transparency
              shape: BoxShape.circle,  // Circular shape
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),  // Inner padding for icon fit
              child: FittedBox(
                child: Image.asset(
                  'assets/icons/location.png',
                  color: const Color.fromARGB(221, 241, 229, 5),  // Slightly lighter black for better contrast on gold
                  errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.location_on_outlined, color: Colors.black87, size: 24),
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/icons/compass.png',
            width: 38,
            height: 38,
            color: Colors.white.withOpacity(0.7),
            errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.explore_outlined, color: Color(0xFFB0B0B0), size: 28),
          ),
          Image.asset(
            'assets/icons/badge.png',
            width: 52,
            height: 58,
            color: Colors.white.withOpacity(0.9),
            errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.person_outlined, color: Color(0xFFB0B0B0), size: 28),
          ),
        ],
      ),
    );
  }
}