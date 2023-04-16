import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_app/config/config.dart';
import 'package:video_player_app/config/singleton/locator.dart';
import 'package:video_player_app/domain/repositories/repositories.dart';
import 'package:video_player_app/presentation/cubits/cubits.dart';
import 'package:video_player_app/presentation/pages/home/home.dart';

void main() async {
  await Future.wait(
    [Environment.initializeEnvironment(), initializeDependencies()],
  );

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
      home: BlocProvider(
        create: (_) => VideoListCubit(locator.get<VideoRepo>())..getVideoList(),
        child: const HomePage(),
      ),
    );
  }
}
