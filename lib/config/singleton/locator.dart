import 'package:get_it/get_it.dart';
import 'package:video_player_app/data/repositories/repositories.dart';
import 'package:video_player_app/data/services/services.dart';
import 'package:video_player_app/domain/repositories/repositories.dart';

final locator = GetIt.instance;

Future initializeDependencies() async {
  final ApiService apiService = ApiService(setupDio());

  locator.registerSingleton<ApiService>(apiService);

  locator.registerSingleton<VideoRepo>(VideoRepoImpl(locator<ApiService>()));
}
