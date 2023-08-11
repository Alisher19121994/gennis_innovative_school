import 'package:logger/logger.dart';

class LogService {
  static final Logger _logger =
      Logger(filter: DevelopmentFilter(), printer: PrettyPrinter());

  static void data(String message) {
    _logger.d(message);
  }

  static void information(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message) {
    _logger.e(message);
  }
}
