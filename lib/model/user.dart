/// Model -> 서버로 부터 받을 데이터 타입을 정의
// 서버로 부터 받는 데이터의 타입은 DTO이다.
// ★ 이 model은 서버 측 Table(Entity)과 동일하게 만들면 된다.

class User {
  int? id;
  String? username;
  String? password;
  String? email;

  User({this.id, this.username, this.password, this.email});

  // Map을 만드는 것이긴 하지만, "fromJson"으로 명칭하기
  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    username = json["username"];
    password = json["password"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "password": password,
      "email": email
    };
  }
}
