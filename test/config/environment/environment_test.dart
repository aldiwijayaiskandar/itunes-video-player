import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_player_app/config/config.dart';

void main() {
  test("Environment initialize not error", () async {
    await Environment.initializeEnvironment();
    expect(Environment.baseUrl, isNot(null));
  });

  test("Environment variable is set with value", () {
    String testBaseUrl = "test_base_url";
    dotenv.testLoad(
      fileInput: '''
          BASE_URL=$testBaseUrl
        ''',
    );
    expect(Environment.baseUrl, testBaseUrl);
  });
}
