import 'package:providers_latihan/app/data/datasource/user_datasource.dart';
import 'package:providers_latihan/app/data/model/user_model.dart';

import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<UserModel> getUser() {
    return userDataSource.getUser();
  }
}
