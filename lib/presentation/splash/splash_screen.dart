import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 402,
          height: 900,
          child: Stack(
            children: [
              /// Background Image
              Transform.scale(
                scale: 1.14, // 🔥 increase for more zoom (1.1 – 1.3 ideal)
                alignment: Alignment(-0.1, 0.6),
                child: Image.asset(
                  "assets/images/splash_image.jpg", // your image path
                  fit: BoxFit.cover,
                ),
              ),

              /// Bottom Frame (Exact Figma Position)
              Positioned(
                top: 281,
                left: 1,
                child: Container(
                  width: 401,
                  height: 619,
                  decoration: BoxDecoration(
                    color: Colors.white, // change to your Figma color
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.0, 0.4327, 1.0],
                      colors: [
                        Color(0xFF9C9F8E), // #9C9F8E
                        Color(0xE89C9F8E), // rgba(156,159,142,0.908654)
                        Color(0x009C9F8E), // transparent
                      ],
                    ),
                  ),
                ),
              ),

              /// Heading Text (Exact Figma Position)
              Positioned(
                top: 281 + 334, // frame top (281) + text top inside frame (334)
                left: 24,
                child: SizedBox(
                  width: 349,
                  height: 136,
                  child: Text(
                    "Catch Every\nBlockbuster Without\nthe Queue",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 33.86,
                      fontWeight: FontWeight.w700,
                      height: 45.14 / 33.86, // exact line-height ratio
                      letterSpacing: 0,
                      color: const Color(0xFF2F302E),
                    ),
                  ),
                ),
              ),

              /// Bottom Button (Exact Figma Specs)
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
    );
  }
}
