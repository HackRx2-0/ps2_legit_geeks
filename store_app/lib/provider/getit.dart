import 'package:http/http.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/services/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/services/prefs_services.dart';
import 'package:store_app/view/home_viewmodel.dart';
import 'package:store_app/view/login_viewmodel.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerSingleton<Prefs>(Prefs());
  getIt.registerSingleton<HomeViewModel>(HomeViewModel());
  getIt.registerFactory(() => ApiService());
  getIt.registerFactory(() => LogInViewModel());
}
