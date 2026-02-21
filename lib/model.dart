import 'package:dio/dio.dart';

final dio = Dio();

class Joke {
  Joke({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      type: json['type']! as String,
      setup: json['setup']! as String,
      punchline: json['punchline']! as String,
      id: json['id']! as int,

    );
  }

  final String type;
  final String setup;
  final String punchline;
  final int id;
}
// future call function
Future<Joke> fetchRandomJoke() async {
  try {
    final response = await dio.get('https://official-joke-api.appspot.com/random_joke');

    if (response.data == null) {
      throw Exception('No data returned from API');
    }

    final data = response.data as Map<String, dynamic>;
    return Joke.fromJson(data);
  } catch (e) {
    print('Error fetching joke: $e');
    throw Exception('Failed to fetch joke');
  }
}