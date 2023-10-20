import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

final dio = Dio();

void main() async {
  await fetchUser_test(1);

  /// List<Map> 요청
}

// JUnit과 다르게 변수를 받을 수 있다.
// 1. 요청한 데이터 dynamic으로 받는다.
Future<List<User>> fetchUser_test(int id) async {
  // Future인 이유는 통신을 대기하면서도 일반 box를 보내야 하기 때문에
  Response<dynamic> response = await dio.get("http://192.168.0.37:8080/user/");
  print(response.data);
  // dynamic = T = Map(정확한 타입)
  // 1차로 바로 Map으로 받지 않는 이유는 Map 또는 List<Map>로 받을 수 있기 때문에 dynamic으로 통일

  // 2. 요청한 데이터를 List<Map>으로 다운캐스팅
  List<dynamic> bodyList = response.data as List<dynamic>;

  // 3. Map -> Dart 오브젝트로 변환
  List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();
  return userList;
}
