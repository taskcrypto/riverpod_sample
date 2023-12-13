import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'riverpod_sample/generator.dart';
import 'riverpod_sample/method.dart';
import 'riverpod_sample/simple.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Spacer(),
          Text('ToggleSwitchView'),
          ToggleSwitchView(),
          Spacer(),
          Text('ToggleSwitchByMethodView'),
          ToggleSwitchByMethodView(),
          Spacer(),
          Text('ToggleSwitchGeneratorView'),
          ToggleSwitchGeneratorView(),
          Spacer(),
        ],
      ),
    );
  }
}
