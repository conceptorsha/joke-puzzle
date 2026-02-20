import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';

final randomJokeProvide = FutureProvider<Joke>((ref) async {
  return fetchRandomJoke();
});