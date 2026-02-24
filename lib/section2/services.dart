import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke/section2/fake_api.dart';
class FakeServices{
  Future<String> fetchGreeting() async {
    await Future.delayed(const Duration(seconds: 2));
    if (Random().nextDouble() < 0.3){
      throw Exception('fail to fetch greeting');

    }
    return'hello from Async!';
  }

}
