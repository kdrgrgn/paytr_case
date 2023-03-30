import 'package:flutter_dotenv/flutter_dotenv.dart';

extension StrExtensions on String {
    String get env => dotenv.get(this);

}