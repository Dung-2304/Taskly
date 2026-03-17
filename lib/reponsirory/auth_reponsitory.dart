import 'package:taskly/Apinetwork/apiendpoint.dart';
import 'package:taskly/Apinetwork/dio_client.dart';
import 'package:taskly/common/local_storage.dart';
import 'package:taskly/config/const.dart';

class AuthReponsitory {
  DioClient _dioClient = DioClient();
  Future<void> login(String username, String password) async {
    try {
      final res = await _dioClient.post(
        ApiEndpoint.login,
        data: {"email": username, "password": password},
      );
      final acessToken = res.data['accessToken'];
      if (acessToken == '' || acessToken == null) {
        throw FormatException('Dang nhap khong thanh cong');
      }
      LocalStorage.setString(kacessToken, acessToken);
    } on FormatException catch (e) {
      rethrow;
    }
  }

  Future<void> register(String email, String password, String name) async {
    try {
      final res = await _dioClient.post(
        ApiEndpoint.register,
        data: {'email': email, 'password': password, 'name': name},
      );
    } on FormatException catch (e) {
      rethrow;
    }
  }
}
