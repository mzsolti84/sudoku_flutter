import 'package:injectable/injectable.dart';

const notWeb = Environment('notWeb');

abstract class AppEnvironment{
  String get userBaseUrl;
}

// @Named("prod")
// @Singleton(as: AppEnvironment)
// class ProdEnvironment extends AppEnvironment{
//   @override
//   String get userBaseUrl => 'https://new.com/';
// }

@Singleton(as: AppEnvironment)
class DevEnvironment extends AppEnvironment{
  @override
  String get userBaseUrl => 'https://cloud-run-sudoku-java-6ytfnsgija-lm.a.run.app/public/';
}

// http://localhost:10122/public/