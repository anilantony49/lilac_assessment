import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieBookingScreen extends StatelessWidget {
  const MovieBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 69,
            left: 16,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 18,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 103,
            left: 148,
            child: Container(
              width: 106,
              height: 106,
              color: Colors.white,
              child: Image.asset('assets/images/tic_image.png'),
            ),
          ),

          Positioned(
            top: 233,
            left: 102,
            child: SizedBox(
              width: 191,
              child: Center(
                child: Text(
                  "Booking Successful",
                  style: GoogleFonts.dmSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.0, // 100% line height
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 141,
            child: SizedBox(
              width: 120,
              child: Text(
                "For Avengers",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 1.0, // 100% line-height
                  letterSpacing: 0,
                  color: const Color(0xFF4A4F62),
                ),
              ),
            ),
          ),

          Stack(
            children: [
              Positioned(
                top: 318,
                left: 71,
                child: Container(
                  width: 260,
                  height: 478,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(-1, 13),
                        blurRadius: 17,
                        color: Color(0x26000000),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Background image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          // alignment: Alignment(3, 6),
                          'assets/images/Image.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),

                      // Second container INSIDE
                      Positioned(
                        top: 340.83,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color.fromARGB(251, 227, 203, 222),
                          ),
                          height: 137,
                          // color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 192,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Date: ",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "April 23",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Time: ",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "6 PM",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 12),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Row: ",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "2",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Seats: ",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "9, 10",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                // width: 190,
                                // height: 50,
                                'assets/images/bar_code.png',
                                // fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 34,
                        top: 20.05,
                        child: SizedBox(
                          // height: 47,
                          width: 191.2,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Doctor Strange\n",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    height: 1.0,
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: "in the Multiverse of Madness",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.0,
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
