import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_assesment/core/network/api_service.dart';
import 'package:lilac_assesment/data/models/movie_models.dart';
import 'package:lilac_assesment/presentation/widgets/home_screen_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  final ScrollController _scrollController = ScrollController();

  List<MovieModels> movies = [];
  // late Future<List<MovieModels>> _movies;
  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !isLoading &&
          hasMore) {
        fetchMovies();
      }
    });
  }

  Future<void> fetchMovies() async {
    setState(() => isLoading = true);

    final newMovies = await _apiService.fetchMovie(currentPage);

    if (newMovies.isEmpty) {
      hasMore = false;
    } else {
      currentPage++;
      movies.addAll(newMovies);
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            // width: double.infinity,
            width: 402,
            height: 1116,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter, // 180deg
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF02021B), // #02021B
                  Color(0xFF590001), // #590001
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -5,
                  left: -83,
                  child: SizedBox(
                    width: 568,
                    height: 582,
                    child: Image.asset(
                      "assets/images/home_screen_bg_image.png", // rename properly
                      fit: BoxFit.cover,
                      // alignment: Alignment.center,
                      alignment: Alignment(1, -1.01),
                    ),
                  ),
                ),

                /// Top Rounded Glass Container
                /// Note: The search icon and text are placed separately to ensure they are above the glass container.
                Positioned(
                  top: 70,
                  left: 24,
                  child: Container(
                    width: 347,
                    height: 46,
                    decoration: BoxDecoration(
                      color: const Color(0x17FFFFFF),
                      borderRadius: BorderRadius.circular(62),
                      border: Border.all(
                        color: const Color(0xA3FFFFFF),
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 83,
                  left: 45.03,
                  child: SizedBox(
                    width: 143,
                    height: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// Search Icon (20x20)
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: Icon(
                            Icons.search, // outline style
                            size: 20,
                            color: Color(0xFFF2F2F2),
                          ),
                        ),

                        const SizedBox(width: 8), // gap: 8px
                        /// Search Movie Text
                        Text(
                          "Search Movie",
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 12,
                            fontWeight: FontWeight.w300, // Light
                            height: 1.0, // 100% line-height
                            letterSpacing: 0,
                            color: const Color(0xFFF2F2F2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Gradient Container Below Search
                Positioned(
                  top: 144,
                  left: 0,
                  child: Container(
                    width: 402,
                    height: 433,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter, // 180deg
                        end: Alignment.bottomCenter,
                        stops: [
                          0.0,
                          0.9038, // 90.38%
                        ],
                        colors: [
                          Color(0x0002021B), // transparent
                          Color(0xFF31010D), // #31010D
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 198,
                  left: 180,
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0x5CFFFFFF),
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(
                        color: const Color(0x75FFFFFF),
                        width: 0.58,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                /// Rounded Glass Small Container
                /// Small Pill Container (63x24)
                Positioned(
                  top: 321,
                  left: 108,
                  child: Row(
                    children: const [
                      GenrePill(text: "Drama", width: 63),
                      SizedBox(width: 8),
                      GenrePill(text: "12+", width: 43),
                      SizedBox(width: 8),
                      GenrePill(text: "Drama", width: 63),
                    ],
                  ),
                ),

                /// Movie Card Container
                Positioned(
                  top: 412,
                  left: -9,

                  child: SidePoster(
                    imagePath: "assets/images/movie_poster_1.png",
                  ),
                ),

                /// Large Movie Card With Shadow
                Positioned(
                  top: 377,
                  left: 135.03,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.38),

                    child: Container(
                      width: 133,
                      height: 192,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(14.38),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 12),
                            blurRadius: 26.6,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          /// Poster Image
                          Image.asset(
                            "assets/images/movie_poster_2.png",
                            width: 133,
                            height: 192,
                            fit: BoxFit.cover,
                            alignment: const Alignment(-0.3, -1),
                          ),

                          /// Gradient Overlay (133x102 at top: 90)
                          Positioned(
                            top: 90,
                            left: -0.03,
                            child: Container(
                              width: 133,
                              height: 102,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter, // 180deg
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0x00000000),
                                    Color(0xFF000000),
                                  ],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 66,
                                    left: 12,
                                    child: Container(
                                      width: 109,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0x91000000,
                                        ), // #00000091
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: const Color(
                                            0x30FFFFFF,
                                          ), // #FFFFFF30
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 7,
                                            left: 22,
                                            child: SizedBox(
                                              width: 67,
                                              height:
                                                  10, // use 24 to respect line-height
                                              child: Text(
                                                "Book Now",
                                                style: GoogleFonts.spaceGrotesk(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight
                                                          .w400, // Regular
                                                  height:
                                                      10 /
                                                      14, // 1.714 exact line height
                                                  letterSpacing: 0,
                                                  color: const Color(
                                                    0xFFFFFFFF,
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
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 412,
                  left: 292,

                  child: SidePoster(
                    imagePath: "assets/images/movie_poster_3.png",
                  ),
                ),

                /// Trending Movie Title
                Positioned(
                  top: 627,
                  left: 16,
                  child: const SectionTitle(title: "Trending Movie Near You"),
                ),

                /// Trending Movie Card (169x94.93)
                Positioned(
                  top: 665,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 95, // same as 94.9253
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16),
                      itemCount: movies.length + (isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < movies.length) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: TrendingMovieCard(
                              poster: movies[index].poster,
                            ),
                          );
                        } else {
                          return const SizedBox(
                            width: 80,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 792,
                  left: 16,
                  child: const SectionTitle(title: "Upcoming"),
                ),

                /// Movie Poster Card (126x187)
                Positioned(
                  top: 830,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 187,
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16),
                      itemCount: movies.length + (isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < movies.length) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: UpcomingCard(poster: movies[index].poster),
                          );
                        } else {
                          return const SizedBox(
                            width: 80,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    ),
                  ),
                ),
                // Positioned(
                //   top: 830,
                //   left: 16,
                //   child: Container(
                //     width: 126,
                //     height: 187,
                //     decoration: BoxDecoration(
                //       color: const Color(0xFF414141), // #414141
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //   ),
                // ),

                // Positioned(
                //   top: 830,
                //   left: 158,
                //   child: Container(
                //     width: 126,
                //     height: 187,
                //     decoration: BoxDecoration(
                //       color: const Color(0xFF414141), // #414141
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 87,
        decoration: const BoxDecoration(
          color: Color(0xFF2C0002),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          border: Border(top: BorderSide(color: Color(0x33FFFFFF), width: 2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BottomNavItem(
              iconPath: "assets/images/home_icon.png",
              label: "Home",
              isActive: true,
            ),
            BottomNavItem(
              iconPath: "assets/images/find_icon.png",
              label: "Find",
              isActive: false,
            ),
            BottomNavItem(
              iconPath: "assets/images/saved_icon.png",
              label: "Saved",
              isActive: false,
            ),
            BottomNavItem(
              iconPath: "assets/images/profile_icon.jpg",
              label: "Profile",
              isActive: false,
              isProfile: true,
            ),
          ],
        ),
      ),
    );
  }
}
