import 'package:dio/dio.dart';

class DioService {
  final dio = Dio();

  void getSingleTodo() async {
    final todoData =
        await dio.get("https://jsonplaceholder.typicode.com/todos/1");
    print("the todo servies:  $todoData");
  }
}
