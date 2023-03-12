import '../../../core/helper/remote_helper.dart';
import '../model/user_model.dart';

class UserDataSource {
  final RemoteHelper remote;

  UserDataSource(this.remote);

  Future<UserModel> getUser() async {
    var res = await remote.get("https://reqres.in/api/users?page=1");
    return UserModel.fromJson(res.data);
  }
}
