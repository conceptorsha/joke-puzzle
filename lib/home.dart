import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke/provide.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JOKE puzzle"),
        backgroundColor: Colors.amber,
      ),
      body: SizedBox.expand(
        child: Consumer(
          builder: (context, ref, child) {
            final randomJoke = ref.watch(randomJokeProvide);

            return Stack(
              alignment: Alignment.center,
              children: [
                if (randomJoke.isLoading)
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(),
                  ),
                Center(
                  child: randomJoke.when(
                    data: (value) => SelectableText(
                      '${value.setup}\n\n${value.punchline}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24),
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (err, stack) => const Text('Error fetching joke'),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: ElevatedButton(
                    onPressed: () => ref.invalidate(randomJokeProvide),
                    child: const Text('Get the joke'),
                  ),
                ),
              ],
            );
          },
        ),



      ),
    );
  }
}
class PracticalTest extends ConsumerWidget {
  const PracticalTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my app",
        style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.red,
           // alignment:Alignment.center
        ),
        ),
      ),
      body:Column(

      ),
    );
  }
}
