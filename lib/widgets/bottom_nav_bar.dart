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
        left: 24.0,
        right: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // Even spacing
        children: [
          Image.asset(
              'assets/icons/Home.png',
              width: 28,
              height: 28,
              color: Colors.white.withOpacity(0.7),  // Tint for inactive (works on PNG)
              errorBuilder: (context, error, stackTrace) => 
                  const Icon(Icons.home_outlined, color: Color(0xFF757575), size: 28),  // Fallback
            ),
          Image.asset(
              'assets/icons/Calender.png',
              width: 48,
              height: 48,
              color: Colors.white.withOpacity(0.7),  // Tint for inactive (works on PNG)
              errorBuilder: (context, error, stackTrace) => 
                  const Icon(Icons.home_outlined, color: Color(0xFF757575), size: 28),  // Fallback
            ),
           Image.asset(
              'assets/icons/location.png',
              width: 55,
              height: 55,
              color: const Color(0xFFFFEB3B),  // Tint for inactive (works on PNG)
              errorBuilder: (context, error, stackTrace) => 
                  const Icon(Icons.home_outlined, color: Color(0xFF757575), size: 28),  // Fallback
            ),
         Image.asset(
              'assets/icons/compass.png',
              width: 38,
              height: 38,
              color: Colors.white.withOpacity(0.7),  // Tint for inactive (works on PNG)
              errorBuilder: (context, error, stackTrace) => 
                  const Icon(Icons.home_outlined, color: Color(0xFF757575), size: 28),  // Fallback
            ),
         Image.asset(
              'assets/icons/badge.png',
              width: 55,
              height: 55,
              color: Colors.white.withOpacity(0.7),  // Tint for inactive (works on PNG)
              errorBuilder: (context, error, stackTrace) => 
                  const Icon(Icons.home_outlined, color: Color(0xFF757575), size: 28),  // Fallback
            ),
        ],
      ),
    );
  }
}