import 'package:dio/dio.dart';

final dio = Dio();

// 동기함수
// void main() {
//   getHttp();
// }

// 비동기함수로 변경 필수
void main() async {
  await getHttp();
}

// 비동기함수
Future<void> getHttp() async {
  final response = await dio.get('https://dart.dev');
  print("1");
  print(response.data);
  print("2");
}
//
// getHttp() 호출 -> dio.get 실행(통신 중) -> 통신 중이지만, get이 실행되어서 -> getHttp() 메소드 종료
// -> main() 종료

// getHttp() 호출 -> await dio.get 실행(통신 중) -> 통신을 기다리면서, 해당 코드 줄에서 실행 멈추고 메소드 나가기(12번)
// * 통신을 기다리면, response에 "FutureBox"를 받아서 18,19,20을 쌩까고 main()으로 간다.
//   main()에서 await는 FutureBox가 다 찰 때까지 기다리는 것이다.
//   통신이 끝나면, response에 데이터가 차고 그 다음 18, 19, 20이 실행된다.
// -> main()으로 빠져나가서 기다리려는데, main()에 대기코드가 없으니 그대로 main() 종료

//
