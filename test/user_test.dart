import 'package:flutter_http_app/model/user.dart';

/// user Map에 데이터를 받아 오는 지 테스트

void main() {
  /// 데이터 받는 방법 1) user 객체 만들기(본인오브젝트)
  // 본인 오브젝트로 데이터를 받으면 사용하기가 편하다.
  User u1 =
      User(id: 1, username: "ssar", password: "1234", email: "ssar@nate.com");
  print(u1.username);

  /// 데이터 받는 방법 2) user Map 타입 만들기
  Map<String, dynamic> u2 = {
    "id": 2,
    "username": "cos",
    "password": "1234",
    "email": "cos@nate.com"
  };
  print(u2["username"]);

  /// u2의 데이터를 object로 변환 / map -> Dart object 변환(수신)
  // 이론상으로 spring에서 받은 object는 flutter에서도 같은 형태의 object가 있어야 한다.
  User u3 = User.fromJson(u2);
  print(u3.username);

  /// Dart object -> map 변환(송신)
}
