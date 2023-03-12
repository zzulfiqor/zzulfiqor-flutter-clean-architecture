import 'dart:developer';

import 'package:providers_latihan/core/helper/usecase_base.dart';

import '../../data/model/user_model.dart';
import '../repository/user_repository.dart';

class GetUserUseCase extends UseCaseNoParams<UserModel> {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  @override
  Future<UserModel> call() {
    return userRepository.getUser();
  }
}
