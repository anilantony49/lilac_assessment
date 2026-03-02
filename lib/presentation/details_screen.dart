import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_assesment/core/network/api_service.dart';
import 'package:lilac_assesment/data/models/movie_details_models.dart';
import 'package:lilac_assesment/presentation/movie_booking_screen.dart';
import 'package:lilac_assesment/presentation/widgets/details_screen_widget.dart';

class DetailsScreen extends StatefulWidget {
  final String imdbID;
  const DetailsScreen({super.key, required this.imdbID});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final ApiService _apiService = ApiService();
  late Future<MovieDetailsModels> _movieDetails;

  @override
  void initState() {
    super.initState();
    _movieDetails = _apiService.fetchMovieDetails(widget.imdbID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 402,
          height: 875,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter, // 180deg
              end: Alignment.bottomCenter,
              colors: [Color(0xFF02021B), Color(0xFF590001)],
            ),
          ),
          child: Stack(
            children: [
              SizedBox(
                height: 243,
                width: 696,
                child: FutureBuilder<MovieDetailsModels>(
                  future: _movieDetails,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          "Failed to load",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const SizedBox();
                    }

                    return Image.network(
                      snapshot.data!.poster,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) => Container(color: Colors.black),
                    );
                  },
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    top: 199,
                    left: 139,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(27),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7.8, sigmaY: 7.8),
                        child: Container(
                          width: 124,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0x54000000), // #00000054
                            borderRadius: BorderRadius.circular(27),
                            border: Border.all(
                              color: const Color(0x70FFFFFF), // #FFFFFF70
                              width: 1,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 9,
                                left: 25,
                                child: SizedBox(
                                  width: 87,
                                  height: 10,

                                  // color: Colors.white, // #FFFFFF
                                  child: Center(
                                    child: Text(
                                      "Watch Trailer",
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: .5,
                                        color: Colors.white,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Add spacing between the text and the play icon
                              Positioned(
                                top: 9,
                                left: 12,
                                child: SizedBox(
                                  width: 8,
                                  height: 9,
                                  child: const Icon(
                                    Icons.play_arrow,
                                    size: 12, // close to 8x9 visual size
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Stack(
                children: [
                  Positioned(
                    top: 259,
                    left: 16,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 90,
                        maxHeight: 24,
                      ),
                      child: Container(
                        // width: 90,
                        height: 24,
                        decoration: BoxDecoration(
                          color: const Color(0x1FFFFFFF), // #FFFFFF1F
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: const Color(0x1AFFFFFF), // #FFFFFF1A
                            width: 1,
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Positioned(
                            //   top: 7,
                            //   left: 8,
                            //   child: SizedBox(
                            //     width: 63,
                            //     height: 10,

                            //     // color: Colors.white,
                            //   ),
                            // ),
                            Positioned(
                              top: 7,
                              left: 8,
                              child: SizedBox(
                                width: 14,
                                height: 10,
                                // color: Colors.white,
                                child: Image.asset(
                                  'assets/images/boom.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 7,
                              left: 26,
                              child: FutureBuilder<MovieDetailsModels>(
                                future: _movieDetails,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: const Text(
                                        'No data',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text('Failed to load');
                                  } else if (snapshot.hasData) {
                                    final genre =
                                        snapshot.data!.genre
                                            .split(',')
                                            .first
                                            .trim();

                                    return ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxWidth: 65,
                                        maxHeight: 10,
                                      ),
                                      child: SizedBox(
                                        // width: 45,
                                        height: 10,
                                        // color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            genre, // Capitalize manually
                                            style: GoogleFonts.spaceGrotesk(
                                              fontSize: 14,
                                              fontWeight:
                                                  FontWeight.w400, // Regular
                                              height:
                                                  .5, // line-height conversion
                                              letterSpacing: 0,
                                              color: Colors.white, // #FFFFFF
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Text('No data available');
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Stack(
                children: [
                  Positioned(
                    top: 259,
                    left: 107,
                    child: Container(
                      width: 69,
                      height: 24,
                      decoration: BoxDecoration(
                        color: const Color(0x1FFFFFFF), // #FFFFFF1F
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: const Color(0x1AFFFFFF), // #FFFFFF1A
                          width: 1,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 7,
                            left: 8,
                            child: SizedBox(
                              width: 63,
                              height: 10,

                              // color: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 7,
                            left: 8,
                            child: SizedBox(
                              width: 14,
                              height: 10,
                              // color: Colors.white,
                              child: Image.asset(
                                'assets/images/star.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 7,
                            left: 26,
                            child: FutureBuilder<MovieDetailsModels>(
                              future: _movieDetails,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  );
                                }
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: const Text(
                                      'No data',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Failed to load');
                                } else if (snapshot.hasData) {
                                  return SizedBox(
                                    width: 45,
                                    height: 10,
                                    // color: Colors.white,
                                    child: Text(
                                      snapshot.data!.genre
                                          .split(",")
                                          .last, // Capitalize manually
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400, // Regular
                                        height: .5, // line-height conversion
                                        letterSpacing: 0,
                                        color: Colors.white, // #FFFFFF
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Text('No data available');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Positioned(
                top: 307,
                left: 16,
                child: FutureBuilder<MovieDetailsModels>(
                  future: _movieDetails,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 24,
                        child: Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Text(
                        "Failed to load",
                        style: TextStyle(color: Colors.white),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const SizedBox();
                    }

                    return Text(
                      snapshot.data!.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        height: 24 / 24, // 1.0
                        letterSpacing: 0,
                        color: const Color(0xFFD9D9D9),
                      ),
                    );
                  },
                ),
              ),

              Positioned(
                top: 348,
                left: 16,
                child: Container(
                  width: 58,
                  height: 22,
                  // padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color(0x1AFFFFFF),
                      width: 0.5,
                    ),
                  ),
                  child: SizedBox(
                    width: 42,
                    height: 10,
                    child: Center(
                      child: FutureBuilder<MovieDetailsModels>(
                        future: _movieDetails,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(
                              child: const Text(
                                'No data',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Failed to load');
                          } else if (snapshot.hasData) {
                            return Text(
                              snapshot.data!.rated,
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: .6, // line-height conversion
                                letterSpacing: 0,
                                color: const Color(0xB2FFFFFF),
                              ),
                            );
                          } else {
                            return const Text('No data available');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 348,
                left: 82,
                child: Container(
                  width: 65,
                  height: 22,
                  // padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color(0x1AFFFFFF), // #FFFFFF1A
                      width: 0.5,
                    ),
                  ),
                  child: FutureBuilder<MovieDetailsModels>(
                    future: _movieDetails,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        );
                      }
                      if (!snapshot.hasData) {
                        return Center(
                          child: const Text(
                            'No data',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Failed to load');
                      } else if (snapshot.hasData) {
                        return SizedBox(
                          width: 49,
                          height: 10,
                          child: Center(
                            child: Text(
                              snapshot.data!.language.split(",").first,
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: .6, // line-height conversion
                                letterSpacing: 0,
                                color: const Color(0xB2FFFFFF),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Text('No data available');
                      }
                    },
                  ),
                ),
              ),

              Positioned(
                top: 348,
                left: 155,
                child: Container(
                  width: 88,
                  height: 22,
                  // padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color(0x1AFFFFFF), // #FFFFFF1A
                      width: 0.5,
                    ),
                  ),
                  child: FutureBuilder<MovieDetailsModels>(
                    future: _movieDetails,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        );
                      }
                      if (!snapshot.hasData) {
                        return Center(
                          child: const Text(
                            'No data',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Failed to load');
                      } else if (snapshot.hasData) {
                        return SizedBox(
                          width: 49,
                          height: 10,
                          child: Center(
                            child: Text(
                              snapshot.data!.runtime,
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: .6, // line-height conversion
                                letterSpacing: 0,
                                color: const Color(0xB2FFFFFF),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Text('No data available');
                      }
                    },
                  ),
                ),
              ),
              Positioned(
                top: 394,
                left: 16,
                child: SizedBox(
                  width: 344,
                  height: 106,
                  child: FutureBuilder<MovieDetailsModels>(
                    future: _movieDetails,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        );
                      }

                      if (!snapshot.hasData) {
                        return Center(
                          child: const Text(
                            'No data',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      if (!snapshot.hasData) {
                        return const SizedBox();
                      }

                      return Text(
                        snapshot.data!.plot,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 24 / 16, // correct conversion
                          letterSpacing: 0,
                          color: const Color(0xB2FFFFFF),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    top: 532,
                    left: 16,
                    child: Container(
                      width: 391,
                      height: 61,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight, // 270deg
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0x08120003), // rgba(18,0,3,0.03)
                            Color(0xFF120003), // #120003
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 12.5,
                            left: 16,
                            child: RotatedBox(
                              quarterTurns: 3, // 270 degrees
                              child: Text(
                                "Cast",
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 24 / 16, // correct line height
                                  letterSpacing: 0,
                                  color: Colors.white,
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

              // Positioned(
              //   top: 546,
              //   left: 79,
              //   child: SizedBox(width: 125, height: 34),
              // ),
              Positioned(
                top: 546,
                left: 79,
                child: FutureBuilder<MovieDetailsModels>(
                  future: _movieDetails,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(
                        child: const Text(
                          'No data',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Failed to load');
                    } else if (snapshot.hasData) {
                      return SizedBox(
                        width: 125,
                        height: 10,
                        child: Text(
                          snapshot.data!.actors
                              .split(",")
                              .first, // Capitalize manually
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: .6, // correct line height
                            color: Colors.white,
                            letterSpacing: 0,
                          ),
                        ),
                      );
                    } else {
                      return const Text('No data available');
                    }
                  },
                ),
              ),
              Positioned(
                top: 572,
                left: 79,
                child: SizedBox(
                  width: 116,
                  height: 8,
                  child: Text(
                    "Tony Stark/Iron Man",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: .4, // 2.0
                      color: const Color(0xA6FFFFFF),
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 546,
                left: 236,
                child: SizedBox(
                  width: 131,
                  height: 10,
                  child: FutureBuilder<MovieDetailsModels>(
                    future: _movieDetails,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        );
                      }
                      if (!snapshot.hasData) {
                        return Center(
                          child: const Text(
                            'No data',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Failed to load');
                      } else if (snapshot.hasData) {
                        return Text(
                          snapshot.data!.actors
                              .split(",")
                              .elementAt(1), // Get second actor
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: .6,
                            color: Colors.white,
                            letterSpacing: 0,
                          ),
                        );
                      } else {
                        return const Text('No data available');
                      }
                    },
                  ),
                ),
              ),
              Positioned(
                top: 572,
                left: 236,
                child: SizedBox(
                  width: 183,
                  height: 8,
                  child: Text.rich(
                    TextSpan(
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: .4, // important
                        color: const Color(0xA6FFFFFF),
                        letterSpacing: 0,
                      ),
                      children: const [
                        TextSpan(text: "Natasha Romanoff/"),
                        TextSpan(
                          text: "Black Widow",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xA6FFFFFF),
                            decorationThickness: 1.2, // make visible
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              Positioned(
                top: 544,
                left: 220,
                child: Container(
                  width: 1,
                  height: 38,
                  color: const Color(0x33FFFFFF),
                ),
              ),

              Positioned(
                top: 625,
                left: 0,
                right: 0,
                child: Container(
                  height: 281,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A0004),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 46,
                        left: 30,
                        child: SizedBox(
                          width: 21,
                          height: 37,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 21,
                                height: 25,
                                child: Text(
                                  "12",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    height: .7, // 1.2
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              // SizedBox(height: 10),
                              SizedBox(
                                width: 17,

                                height: 10,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Fri",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: .7,
                                    color: const Color(0x80FFFFFF),
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: 50,
                        left: 67,
                        child: Container(
                          width: 1,
                          height: 28,
                          color: const Color(0x1CFFFFFF),
                        ),
                      ),
                      Positioned(
                        top: 46,
                        left: 83,
                        child: SizedBox(
                          width: 21,
                          height: 37,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 21,
                                height: 25,
                                child: Text(
                                  "13",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    height: .7, // 1.2
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              // SizedBox(height: 10),
                              SizedBox(
                                width: 23,
                                height: 10,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Sat",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: .7,
                                    color: const Color(0x80FFFFFF),
                                    letterSpacing: -.99,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: 50,
                        left: 120,
                        child: Container(
                          width: 1,
                          height: 28,
                          color: const Color(0x1CFFFFFF),
                        ),
                      ),
                      Positioned(
                        top: 46,
                        left: 136,
                        child: SizedBox(
                          width: 21,
                          height: 37,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 21,
                                height: 25,
                                child: Text(
                                  "14",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    height: .7, // 1.2
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 26,
                                height: 10,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Sun",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    height: .7,
                                    color: const Color(0x80FFFFFF),
                                    letterSpacing: -.99,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 279,
                        child: Container(
                          width: 1,
                          height: 28,
                          color: const Color(0x1CFFFFFF),
                        ),
                      ),

                      Positioned(
                        top: 46,
                        left: 242,
                        child: SizedBox(
                          width: 21,
                          height: 37,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 21,
                                height: 25,
                                child: Text(
                                  "16",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    height: .7, // 1.2
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 26,
                                height: 10,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Thu",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    height: .7,
                                    color: const Color(0x80FFFFFF),
                                    letterSpacing: -.99,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 332,
                        child: Container(
                          width: 1,
                          height: 28,
                          color: const Color(0x1CFFFFFF),
                        ),
                      ),

                      Positioned(
                        top: 46,
                        left: 295,
                        child: SizedBox(
                          width: 21,
                          height: 37,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 21,
                                height: 25,
                                child: Text(
                                  "17",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    height: .7, // 1.2
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 26,
                                height: 10,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "The",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    height: .7,
                                    color: const Color(0x80FFFFFF),
                                    letterSpacing: -.99,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 385,
                        child: Container(
                          width: 1,
                          height: 28,
                          color: const Color(0x1CFFFFFF),
                        ),
                      ),

                      Positioned(
                        top: 46,
                        left: 348,
                        child: SizedBox(
                          width: 21,
                          height: 37,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 21,
                                height: 25,
                                child: Text(
                                  "18",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    height: .7, // 1.2
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 26,
                                height: 10,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Fri",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    height: .7,
                                    color: const Color(0x80FFFFFF),
                                    letterSpacing: -.99,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: 39,
                        left: 173,
                        child: Container(
                          width: 54,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 7,
                                left: 12,
                                child: SizedBox(
                                  width: 30,
                                  height: 37,
                                  // color: const Color(0xFF1A0004),
                                ),
                              ),
                              Positioned(
                                top: 7,
                                left: 16,
                                child: Text(
                                  "15",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500, // Medium
                                    height: 24 / 20,
                                    color: const Color(0xFF1A0004),
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 34,
                                left: 12,
                                child: Text(
                                  "Mon",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    color: const Color(0xFF1A0004),
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: 115,
                        left: 24,
                        right: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            TimeSlotWidget(time: "09:40 AM"),
                            TimeSlotWidget(time: "11:20 AM"),
                            TimeSlotWidget(time: "02:30 PM"),
                            TimeSlotWidget(time: "05:45 PM"),
                          ],
                        ),
                      ),

                      Positioned(
                        top: 160,
                        left: 16,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(80),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const MovieBookingScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 370,
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF60000),
                                borderRadius: BorderRadius.circular(80),
                              ),
                              child: Center(
                                child: Text(
                                  "Book Now",
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 24 / 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
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
        ),
      ),
    );
  }
}
