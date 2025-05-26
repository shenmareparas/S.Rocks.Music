import 'package:get_it/get_it.dart';
import 'repositories/service_repository.dart';
import 'viewmodels/service_viewmodel.dart';

final GetIt getIt = GetIt.instance;

void setupDI() {
  getIt.registerSingleton<ServiceRepository>(ServiceRepository());

  getIt.registerFactory<ServiceViewModel>(() => ServiceViewModel());
}