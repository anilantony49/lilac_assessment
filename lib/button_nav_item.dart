import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final bool isProfile; // 👈 NEW

  const BottomNavItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    this.isProfile = false, // default normal icon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child:
              isProfile
                  ? ClipOval(child: Image.asset(iconPath, fit: BoxFit.cover))
                  : Image.asset(iconPath, fit: BoxFit.contain),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.0,
            color: Colors.white,
            shadows:
                isActive
                    ? const [
                      Shadow(
                        color: Color(0xFF8C070A),
                        offset: Offset(0, 11),
                        blurRadius: 15,
                      ),
                    ]
                    : null,
          ),
        ),
      ],
    );
  }
}

class UpcomingCard extends StatelessWidget {
  const UpcomingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 126,
      height: 187,
      decoration: BoxDecoration(
        color: const Color(0xFF414141),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.spaceGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: 0,
        color: const Color(0xFFD9D9D9),
      ),
    );
  }
}

class TrendingMovieCard extends StatelessWidget {
  const TrendingMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169,
      height: 94.9253,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xFF94061C), width: 0.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF7D0015),
            offset: Offset(0, 6),
            blurRadius: 17.2,
          ),
        ],
      ),
    );
  }
}

class GenrePill extends StatelessWidget {
  final String text;
  final double width;

  const GenrePill({super.key, required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0x1FFFFFFF),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: const Color(0x1AFFFFFF), width: 1),
      ),
      child: Text(
        text,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 24 / 14,
          color: const Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}

class SidePoster extends StatelessWidget {
  final String imagePath;

  const SidePoster({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 173,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13.92),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill, // better than contain
        ),
      ),
    );
  }
}
