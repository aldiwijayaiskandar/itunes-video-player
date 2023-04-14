import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:video_player_app/config/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.light
          ? Themes.light
          : Themes.dark,
    );
  }
}
