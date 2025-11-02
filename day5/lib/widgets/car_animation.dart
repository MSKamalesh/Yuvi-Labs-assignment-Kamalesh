import 'package:flutter/material.dart';

class CarAnimation extends StatelessWidget {
  const CarAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              _cloud(left: 30, top: -10, width: 70, height: 50),
              _cloud(right: 30, top: 1, width: 95, height: 45),
              _road(left: 0, right: 120, color: Colors.black),
              _road(left: 255, right: 0, color: Colors.grey[400]!),
              _dot(left: 0, color: Colors.black),
              _dot(right: 0, color: Colors.grey[400]!),
              Positioned(
                left: 70,
                bottom: -18,
                child: Image.asset(
                  'assets/icons/car.png',
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

  Widget _cloud({double? left, double? right, required double top, required double width, required double height}) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.grey[350]!, BlendMode.srcIn),
        child: Image.asset('assets/images/cloud.png', width: width, height: height, fit: BoxFit.contain),
      ),
    );
  }

  Widget _road({double? left, double? right, required Color color}) {
    return Positioned(
      bottom: 40,
      left: left,
      right: right,
      child: Container(height: 4, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
    );
  }

  Widget _dot({double? left, double? right, required Color color}) {
    return Positioned(
      left: left,
      right: right,
      bottom: 26,
      child: Container(width: 30, height: 30, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
    );
  }
}
