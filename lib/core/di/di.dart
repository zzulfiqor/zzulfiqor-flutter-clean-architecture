import 'package:get_it/get_it.dart';

import '../../app/data/datasource/user_datasource.dart';
import '../../app/data/repository/user_repository_impl.dart';
import '../../app/domain/repository/user_repository.dart';
import '../../app/domain/usecase/get_user_usecase.dart';
import '../helper/remote_helper.dart';

Future<void> registerDependencies() async{
  // Register the Dependency Injection
  GetIt.I.registerLazySingleton<RemoteHelper>(() => RemoteHelper());

  // Data Source
  GetIt.I.registerLazySingleton<UserDataSource>(() => UserDataSource(GetIt.I.get()));

  // Repository
  GetIt.I.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(GetIt.I.get<UserDataSource>()));

  // UseCase
  GetIt.I.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(GetIt.I.get<UserRepository>()));
}