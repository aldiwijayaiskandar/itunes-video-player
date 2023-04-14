import 'package:get_it/get_it.dart';
import 'package:video_player_app/data/services/services.dart';

final locator = GetIt.instance;

Future initializeDependencies() async {
  final ApiService apiService = ApiService(setupDio());

  locator.registerSingleton<ApiService>(apiService);
}
