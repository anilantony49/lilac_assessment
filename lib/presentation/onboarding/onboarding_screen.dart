import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondOnboardingScreen extends StatelessWidget {
  const SecondOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 402,
          height: 900,
          child: Container(
            color: const Color(0xFFFFFFFF),
            child: Stack(
              children: [
                /// Example Top Image (Optional)
                Positioned.fill(
                  child: Transform.scale(
                    scale: 1.14, // 🔥 increase for more zoom (1.1 – 1.3 ideal)
                    alignment: Alignment(-0.1, 0.2),

                    child: Image.asset(
                      "assets/images/onboarding_image.png", // rename properly

                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// Bottom Blue Gradient Frame
                Positioned(
                  top: 222,
                  left: 1,
                  child: Container(
                    width: 401,
                    height: 678,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter, // 360deg
                        end: Alignment.topCenter,
                        stops: [0.0, 0.3551, 1.0],
                        colors: [
                          Color(0xFF26539E), // #26539E
                          Color(0xFF26539E), // 35.51%
                          Color(0x0026539E), // transparent
                        ],
                      ),
                    ),
                  ),
                ),

                /// Screen 2 Heading Text (Exact Figma Position)
                Positioned(
                  top: 615,
                  left: 24,
                  child: SizedBox(
                    width: 349,
                    height: 136,
                    child: Text(
                      "Because\nMoviesDeserve\nMore Than Queues",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 33.86,
                        fontWeight: FontWeight.w700,
                        height: 45.14 / 33.86, // exact line-height ratio
                        letterSpacing: 0,
                        color: const Color(0xFFFFFFFF), // #FFFFFF
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 50, // derived from Figma top value
                  left: 15,
                  child: Container(
                    width: 370,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0x33FFFFFF), // #FFFFFF33
                      borderRadius: BorderRadius.circular(80),
                      border: Border.all(
                        color: const Color(0x66FFFFFF), // #FFFFFF66
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
