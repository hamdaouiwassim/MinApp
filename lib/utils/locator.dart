import 'package:get_it/get_it.dart';
import 'package:minicipalite_app/repositories/post_repository.dart';
import 'package:minicipalite_app/services/auth_service.dart';
import 'package:minicipalite_app/services/crud_post_service.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => CrudPostService('posts'));
  locator.registerLazySingleton(() => PostRepository());
}
