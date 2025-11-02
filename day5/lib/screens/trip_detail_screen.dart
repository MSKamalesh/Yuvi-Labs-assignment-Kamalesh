import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: const TripDetailScreen(),
    );
  }
}

class PieProgressPainter extends CustomPainter {
  final double progress;
  final double greenPortion;
  final double yellowPortion;

  PieProgressPainter({
    required this.progress,
    this.greenPortion = 0.35,
    this.yellowPortion = 0.3,
  }) : assert(greenPortion + yellowPortion <= progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final strokeWidth = 15.0;
    final radius = size.width / 2 - strokeWidth / 2;
    final startAngle = -math.pi / 2;

    // Background full circle (gray ring)
    final bgPaint = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;
    canvas.drawCircle(center, radius, bgPaint);

    // Green arc (first, starting from top)
    final greenPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;
    final greenAngle = 2 * math.pi * greenPortion;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      greenAngle,
      false,
      greenPaint,
    );

    // Yellow arc (starting after green)
    final yellowPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;
    final yellowAngle = 2 * math.pi * yellowPortion;
    final yellowStartAngle = startAngle + greenAngle;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      yellowStartAngle,
      yellowAngle,
      false,
      yellowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Header Section
                    _buildHeader(context),
                    const SizedBox(height: 0),
                    // Car Animation Section
                    _buildCarAnimation(context),
                    const SizedBox(height: 5),
                    // Combined Trip Card
                    _buildCombinedTripCard(),
                    const SizedBox(height: 9),
                    // View History Button
                    _buildViewHistoryButton(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 30),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: const Icon(Icons.qr_code_scanner, size: 30),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: const Icon(Icons.layers_outlined, size: 30),
                  ),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            // decoration: BoxDecoration(
            //   color: Colors.grey[200],
            //   borderRadius: BorderRadius.circular(20),
            // ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD700),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icons/Calender.png', // Replace with your exact asset path in assets/icon folder
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
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
          ),
        ],
      ),
    );
  }

  Widget _buildCarAnimation(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final halfWidth = constraints.maxWidth / 2;
        return Container(
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              // Left cloud using image, tinted light grey without outline
              Positioned(
                left: 30,
                top: -10,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.grey[350]!, BlendMode.srcIn),
                  child: Image.asset(
                    'assets/images/cloud.png', // Adjust path if needed, e.g., 'assets/images/cloud_left.png'
                    width: 70,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Right cloud using image, tinted light grey without outline
              Positioned(
                right: 30,
                top: 1,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.grey[350]!, BlendMode.srcIn),
                  child: Image.asset(
                    'assets/images/cloud.png', // Adjust path if needed, e.g., 'assets/images/cloud_right.png'
                    width: 95,
                    height: 45,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Sun (commented out as per previous code)
              // Positioned(
              //   right: 80,
              //   top: 15,
              //   child: Container(
              //     width: 30,
              //     height: 30,
              //     decoration: const BoxDecoration(
              //       color: Colors.yellow,
              //       shape: BoxShape.circle,
              //     ),
              //   ),
              // ),
              // Road background - Split into half black (left) and grey (right)
              // Left half road (black)
              Positioned(
                bottom: 40,
                left: 0,
                right: 120,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Right half road (grey)
              Positioned(
                bottom: 40,
                left: 255,
                right: 0,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Start point (black)
              Positioned(
                left: 0,
                bottom: 26,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // End point (grey)
              Positioned(
                right: 0,
                bottom: 26,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Car icon - Replaced with image from assets
              Positioned(
                left: 70,
                bottom: -18,
                child: Image.asset(
                  'assets/icons/car.png', // Replace with your exact asset path, e.g., 'assets/images/car_green.png'
                  width: 210,
                  height: 210,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCombinedTripCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(44),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Location section
          Row(
            children: [
              // Location icon with pie chart progress
              SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(70, 70),
                      painter: PieProgressPainter(progress: 0.65),
                    ),
                    // const Text(
                    //   '🥐',
                    //   style: TextStyle(fontSize: 24),
                    // ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Location info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Paris',
                      style: TextStyle(
                        fontFamily: 'MSK',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '1200km • City',
                      style: TextStyle(
                        fontFamily: 'SKReykjavikRounded',
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              // Price
              const Text(
                '\$320.0',
                style: TextStyle(
                  fontFamily: 'MSK1',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Divider
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          const SizedBox(height: 16),
          // Time and Route section
          Row(
            children: [
              // Time icon
              // Time icon
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  // color: const Color(0xFFE8F5E9),
                  // borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  'assets/icons/sandclock.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 10),
              // Time info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time for way',
                      style: TextStyle(
                        fontFamily: 'SKReykjavikRounded',
                        fontSize: 13,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '4h 20min',
                      style: TextStyle(
                        fontFamily: 'MSK',
                        fontSize: 18,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Route info
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Munich - Paris',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '23 May - 30 May • 2025',
                    style: TextStyle(
                      fontFamily: 'SKReykjavikRounded',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          // Divider
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          const SizedBox(height: 1),
          // Tour Image - Replaced with paris_background.png
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Image.asset(
              'assets/images/paris_background.jpeg',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          // Tour Info
          Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Exclusive Tour',
                    style: TextStyle(
                      fontFamily: 'MSK1',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Paris, France',
                    style: TextStyle(
                      fontFamily: 'SKReykjavikRounded',
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    // decoration: BoxDecoration(
                    //   color: Colors.grey[100],
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                    child: Row(
                      children: [
                        Image.asset('assets/icons/Calender.png', width: 24, height: 24, fit: BoxFit.contain),
                        SizedBox(width: 4),
                        Text(
                          '23 - 30 May',
                          style: TextStyle(
                              fontFamily: 'MSK1',
                              color: Colors.grey[850],
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star,
                    color: Color(0xFFFFD700),
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '4.7',
                    style: TextStyle(
                      fontFamily: 'SKReykjavikRounded',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '(43 Reviews)',
                    style: TextStyle(
                      fontFamily: 'SKReykjavikRounded',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildViewHistoryButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFFE2DFDF),
          side: BorderSide(color: Colors.grey[100]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'View History',
              style: TextStyle(
                fontFamily: 'MSK',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey[800],
            ),
          ],
        ),
      ),
    );
  }
}