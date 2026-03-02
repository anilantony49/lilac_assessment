import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeSlotWidget extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeSlotWidget({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 78,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0x1AFFFFFF),
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: isSelected ? Colors.white : const Color(0x33FFFFFF),
            width: 1,
          ),
        ),
        child: Text(
          time,
          textAlign: TextAlign.center,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            height: 24 / 14,
            color: isSelected ? const Color(0xFF1A0004) : Colors.white,
          ),
        ),
      ),
    );
  }
}

class DateItem extends StatelessWidget {
  final String day;
  final String weekDay;
  final bool isSelected;
  final VoidCallback onTap;

  const DateItem({
    super.key,
    required this.day,
    required this.weekDay,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isSelected ? 54 : null,
        height: isSelected ? 52 : null,
        padding:
            isSelected
                ? const EdgeInsets.symmetric(vertical: 5)
                : EdgeInsets.zero,
        decoration:
            isSelected
                ? BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                )
                : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              day,
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 20,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                height: 24 / 20,
                color: isSelected ? const Color(0xFF1A0004) : Colors.white,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              weekDay,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                height: isSelected ? 1 : 24 / 20,
                color:
                    isSelected
                        ? const Color(0xFF1A0004)
                        : const Color(0x80FFFFFF),
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateDivider extends StatelessWidget {
  const DateDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 28, color: const Color(0x1CFFFFFF));
  }
}
