import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke/section2/services.dart';
// creating future provider
final fakeApiProvider = Provider((_) => FakeServices());
final greetingFutureProvider = FutureProvider((Ref ref) async {
  final  service = ref.read(fakeApiProvider);
  return await service.fetchGreeting();
});

class GreetingScreen extends ConsumerWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context,    WidgetRef ref) {
    final greetingAsync = ref.watch(greetingFutureProvider);
    return Scaffold(
      appBar: AppBar(title: Text('GREETINGS')),
      body: Center(
child: greetingAsync.when(
    data: (greeting) => Text(greeting, style: const TextStyle(fontSize: 24),),
    error: (error, stackTrace) =>Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Error:$error',style: const TextStyle(color: Colors.red),),
        const SizedBox(height: 12,),
        ElevatedButton(onPressed: () => ref.refresh(greetingFutureProvider),
             child: const Text('Retry'))
      ],
    ),

    loading: () => CircularProgressIndicator(),
),
      ),
    );
  }
}