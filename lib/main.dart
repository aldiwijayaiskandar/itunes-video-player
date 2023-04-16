import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_app/config/config.dart';
import 'package:video_player_app/config/singleton/locator.dart';
import 'package:video_player_app/domain/repositories/repositories.dart';
import 'package:video_player_app/presentation/presentation.dart';

void main() async {
  await Environment.initializeEnvironment();
  await initializeDependencies();

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CurrentVideoCubit(),
          ),
          BlocProvider(
            create: (_) => VideoListCubit(locator<VideoRepo>()),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
