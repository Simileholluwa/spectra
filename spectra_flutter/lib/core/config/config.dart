import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment {
  develop,
  production,
}

Environment _env = Environment.develop;

class Env {
  static init() async {
    late final String envPath;
    const envOverride = String.fromEnvironment('ENV');
    if (envOverride.isNotEmpty) {
      switch (envOverride.toLowerCase()) {
        case 'develop':
          _env = Environment.develop;
          break;
        case 'production':
          _env = Environment.production;
          break;
      }
    }
    switch (_env) {
      case Environment.develop:
        envPath = 'assets/env/dev_env';
        break;
      case Environment.production:
        envPath = 'assets/env/prod_env';
        break;
    }

    await dotenv.load(fileName: envPath);
  }

  static String get apiBaseUrl {
    return dotenv.env['API_BASE_URL']!;
  }

  static String get pythonFastApi {
    return dotenv.env['PYTHON_FAST_API']!;
  }
}
