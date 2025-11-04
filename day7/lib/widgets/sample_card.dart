import 'package:flutter/material.dart';

class SampleCard extends StatelessWidget{
  const SampleCard ({super.key});
  @override
  Widget build(BuildContext context){
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
          const SizedBox(height: 8),
          _buildTourInfo(),
        ],
      ),
    );
  }

  Widget _buildTourInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
        elevation: 10,
        shadowColor:Colors.black.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
            'assets/images/paris_background.jpeg',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover
        ),
      ),
      ],
    );
    }
}