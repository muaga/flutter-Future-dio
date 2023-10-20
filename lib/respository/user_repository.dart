import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

// Dio를 쓰면, 해당 url이 자동 붙는다.
final dio = Dio(BaseOptions(baseUrl: "http://192.168.0.37:8080"));

class UserRepository {
  Future<User> fetchUser(int id) async {
    // 1. 데이터 요청하기
    Response<dynamic> response = await dio.get("/user/${id}");
    print(response.data);

    // 2. 요청한 데이터를 Map으로 다운캐스팅
    Map<String, dynamic> body = response.data as Map<String, dynamic>;
    print(body["username"]);
    // body = 데이터

    // 3. Map -> Dart 오브젝트로 변환
    User user = User.fromJson(body);
    return user;
  }

  Future<List<User>> fetchUserList() async {
    // 1. 데이터 요청하기
    Response<dynamic> response = await dio.get("/user");
    print(response.data);

    // 2. 요청한 데이터를 List<Map>으로 다운캐스팅
    List<dynamic> bodyList = response.data as List<dynamic>;

    // 3. Map -> Dart 오브젝트로 변환
    List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();
    return userList;
  }
}
