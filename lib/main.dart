import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/user.dart';
import 'package:flutter_http_app/respository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}

/// userList 데이터를 받은 후 화면에 뿌리기
class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// 빌드되기 직전 -> 모든 데이터 1번에 받기 = 빌드 총 1번

    return Scaffold(
      body: FutureBuilder<User?>(
        future: UserRepository().fetchUser(1),
        builder: (context, snapshot) {
          print("그림이 그려짐!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          if (snapshot.hasData) {
            // 통신이 끝난 상태
            User user = snapshot.data ??
                User(
                    id: 0,
                    username: 'unknown',
                    password: 'unknown',
                    email: 'unknown@example.com');
            return ListTile(
              leading: Text("${user.id}"),
              title: Text("${user.username}"),
              subtitle: Text("${user.email}"),
            );
          } else {
            // 통신 중인 상태
            return Center(child: CircularProgressIndicator());
          }
        }, // 데이터 뿌리기
      ),
    );
    //
    // return Scaffold(
    //     body: FutureBuilder<List<User>>(
    //     future: UserRepository().fetchUserList(),
    // builder: (context, snapshot) {
    // // snapshot = return 된 데이터
    //
    // if (snapshot.hasData) {
    // // 통신이 끝난 상태
    //
    // List<User> userList = snapshot.data ?? [];
    // // 통신이 끝나더라도 애초에 DB에 데이터가 존재하지 않을 수 있기 때문에 null일 때, 빈 배열 담기
    //
    // return ListView.builder(
    // itemCount: userList.length,
    // itemBuilder: (context, index) {
    // return ListTile(
    // leading: Text("${userList[index].id}"),
    // title: Text("${userList[index].username}"),
    // subtitle: Text("${userList[index].email}"),
    // );
    // },
    // );
    // } else {
    // // 통신 중인 상태
    // return Center(child: CircularProgressIndicator());
    // }
    // }, // 데이터 뿌리기
  }
}
