import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke/provider/provider2.dart';
import 'package:joke/provider/state_provider.dart';
import 'package:joke/section2/fake_api.dart';

import 'home.dart';

void main() {
  runApp(const ProviderScope(
      child:MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GreetingScreen(),
    );
  }
}

