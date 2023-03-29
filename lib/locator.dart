
import 'package:get_it/get_it.dart';
import 'package:paytr_case/view_model/countries_view_model.dart';
import 'package:paytr_case/view_model/auth_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  if (!locator.isRegistered<CountriesViewModel>()) {
    locator.registerLazySingleton(() => CountriesViewModel());
  }
  if (!locator.isRegistered<AuthViewModel>()) {
    locator.registerLazySingleton(() => AuthViewModel());
  }

}
