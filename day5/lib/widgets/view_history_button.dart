import 'package:flutter/material.dart';

class ViewHistoryButton extends StatelessWidget {
  const ViewHistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFFE2DFDF),
          side: BorderSide(color: Colors.grey[100]!),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 22),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'View History',
              style: TextStyle(
                fontFamily: 'MSK',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, color: Colors.grey[800]),
          ],
        ),
      ),
    );
  }
}
