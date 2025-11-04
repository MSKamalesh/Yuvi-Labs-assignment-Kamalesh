import 'package:flutter/material.dart';
import 'dart:math' as math;

class TripCard extends StatelessWidget {
  const TripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(44),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          _buildTopRow(),
          const SizedBox(height: 1),
          Divider(color: Colors.grey[200]),
          const SizedBox(height: 6),
          _buildTimeAndRoute(),
          const SizedBox(height: 8),
          // Divider(color: Colors.grey[200]),
          const SizedBox(height: 8),
          _buildTourInfo(),
        ],
      ),
    );
  }

  Widget _buildTopRow() {
    return Row(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CustomPaint(
            size: const Size(70, 70),
            painter: PieProgressPainter(progress: 1.0),
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Paris',
                  style: TextStyle(
                      fontFamily: 'MSK',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  )
              ),
              SizedBox(height: 4),
              Text('1200km • City',
                  style: TextStyle(
                      fontFamily: 'SKReykjavikRounded',
                      fontSize: 16,
                      color: Colors.black87
                  )
              ),
            ],
          ),
        ),
        const Text(
          '\$320.0',
          style: TextStyle(
              fontFamily: 'MSK1',
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
      ],
    );
  }

  Widget _buildTimeAndRoute() {
    return Row(
      children: [
        Image.asset('assets/icons/sandclock.png', width: 58, height: 58),
        const SizedBox(width: 0),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Time for way',
                  style: TextStyle(
                      fontFamily: 'SKReykjavikRounded',
                      fontSize: 16,
                      color: Colors.black54
                  )
              ),
              // SizedBox(height: 4),
              Text('4h 20min', style: TextStyle(
                  fontFamily: 'SKReykjavikRounded',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.black
              )
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('Munich - Paris',
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
                )
            ),
            const SizedBox(height: 7),
            Text('23 May - 30 May • 2025',
                style: TextStyle(
                    fontFamily: 'SKReykjavikRounded',
                    fontSize: 12,
                    color: Colors.grey[700]
                )
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTourInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 6,
          shadowColor: Colors.black.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          //borderRadius: BorderRadius.circular(12),
          child: Image.asset(
              'assets/images/paris_background.jpeg',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Exclusive Tour',
                  style: TextStyle(
                fontFamily: 'MSK1',
                fontSize: 20,
                fontWeight: FontWeight.w500
                )
            ),
            Text('Paris, France',
                style: TextStyle(
                    fontFamily: 'SKReykjavikRounded',
                    fontSize: 14,
                    color: Colors.black54
                )
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
    );
  }
}

class PieProgressPainter extends CustomPainter {
  final double progress;
  final double greenPortion;
  final double yellowPortion;

  PieProgressPainter({
    required this.progress,
    this.greenPortion = 0.45,
    this.yellowPortion = 0.3,
  }) : assert(greenPortion + yellowPortion <= progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final strokeWidth = 17.0;
    final radius = size.width / 2 - strokeWidth / 2;
    final startAngle = -math.pi / 2;

    final bgPaint = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final greenPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final yellowPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final greenAngle = 2 * math.pi * greenPortion;
    final yellowAngle = 2 * math.pi * yellowPortion;
    final yellowStart = startAngle + greenAngle;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, greenAngle, false, greenPaint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), yellowStart, yellowAngle, false, yellowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
