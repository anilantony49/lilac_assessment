import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeSlotWidget extends StatelessWidget {
  final String time;
  const TimeSlotWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0x1AFFFFFF),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0x33FFFFFF), width: 1),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 13,
            left: 7,
            child: SizedBox(
              width: 64,
              height: 10,
              child: Text(
                time,
                textAlign: TextAlign.center,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: .6,
                  color: Colors.white,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateItem extends StatelessWidget {
  final String day;
  final String week;
  // final bool isSelected;

  const DateItem({
    super.key,
    required this.day,
    required this.week,
    // this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              height: 24 / 20,
              color: Colors.white,
            ),
          ),
          Text(
            week,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 24 / 14,
              color: const Color(0x80FFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
