import 'package:dio/dio.dart';
import 'package:lilac_assesment/core/config/env_config.dart';
import 'package:lilac_assesment/core/network/api_constants.dart';
import 'package:lilac_assesment/data/models/movie_models.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,

      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),

      headers: {"Content-Type": "application/json"},
    ),
  );

  Future<List<MovieModels>> fetchMovie(int page) async {
    try {
      final response = await _dio.get(
        "${ApiConstants.baseUrl}/?apikey=${EnvConfig.apiKey}&s=avengers&page=$page",
        // queryParameters: {
        //   "apikey": EnvConfig.apiKey,
        //   "s": "avengers",
        //   "page": 1,
        // },
      );

      if (response.statusCode == 200) {
        final List<dynamic> movies = response.data['Search'] ?? [];

        return movies.map((movie) => MovieModels.fromJson(movie)).toList();
      } else {
        throw Exception("Failed to load movies");
      }
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
