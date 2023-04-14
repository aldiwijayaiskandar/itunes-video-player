import "package:flutter_dotenv/flutter_dotenv.dart";

class Environment {
  static Future initializeEnvironment() async {
    const String environment = String.fromEnvironment(
      "ENV",
      defaultValue: "development",
    );

    await dotenv.load(fileName: 'lib/config/envs/$environment.env');
  }
}
