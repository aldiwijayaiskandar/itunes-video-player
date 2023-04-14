import 'package:get_it/get_it.dart';
import 'package:video_player_app/data/services/services.dart';

final locator = GetIt.instance;

Future initializeDependencies() async {
  final ApiService apiService = ApiService();

  locator.registerSingleton<ApiService>(apiService);
}
