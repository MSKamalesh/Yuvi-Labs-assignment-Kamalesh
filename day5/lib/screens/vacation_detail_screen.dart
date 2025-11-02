import 'package:flutter/material.dart';
import '../widgets/trip_header.dart';
import '../widgets/car_animation.dart';
import '../widgets/trip_card.dart';
import '../widgets/view_history_button.dart';

class VacationDetailScreen extends StatelessWidget {
  const VacationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              TripHeader(),
              SizedBox(height: 5),
              CarAnimation(),
              SizedBox(height: 10),
              TripCard(),
              SizedBox(height: 20),
              ViewHistoryButton(),
            ],
          ),
        ),
      ),
    );
  }
}
