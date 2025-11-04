import 'package:flutter/material.dart';

class TripHeader extends StatelessWidget {
  const TripHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _roundButton(Icons.arrow_back, () => Navigator.pop(context)),
              Row(
                children: [
                  _roundButton(Icons.qr_code_scanner, () {}),
                  const SizedBox(width: 12),
                  _roundButton(Icons.layers_outlined, () {}),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            'ROAD: TRIP',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Munich to Paris',
            style: TextStyle(
              fontFamily: 'BRHendrix',
              fontWeight: FontWeight.w700,
              fontSize: 36,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFD700),
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/icons/Calender.png'),
              ),
              const SizedBox(width: 8),
              const Text(
                '23 - 30 May',
                style: TextStyle(
                  fontFamily: 'SKReykjavikRounded',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _roundButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
      ),
      child: IconButton(
        icon: Icon(icon, size: 30),
        onPressed: onPressed,
      ),
    );
  }
}
