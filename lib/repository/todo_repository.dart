import 'dart:convert';
import 'package:my_practice_app/model/todo.dart';
import 'package:my_practice_app/repository/http_clone_coding_repository.dart';
import 'package:http/http.dart' as http;

//https://www.youtube.com/watch?v=jymr1hEvfkM&t=611s 에서 이 강의를 시청해보세요!

class TodoRepository implements Repository {
  //use http
  String dataURL = 'https://jsonplaceholder.typicode.com';

  @override
  Future<String> deleteTodo(Todo todo) async {
    var url = Uri.parse('$dataURL/todos');
    var result = 'false';
    await http.delete(url).then((value) => print(value.body));
    return result = 'true';
  }

  // get example
  @override
  Future<List<Todo>> getTodoList() async {
    List<Todo> todoList = [];
    //https://jsonplaceholder.typicode.com/todos
    var url = Uri.parse('$dataURL/todos');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    print("yes, it work's!!!");
    var body = json.decode(response.body);
    //parse
    for (var i = 0; i < body.length; i++) {
      todoList.add(Todo.fromJson(body[i]));
    }
    return todoList;
  }

  // patch example
  //pathc => Modify passed varieales only.
  @override
  Future<String> patchCompleted(Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    //call back data
    String resData = '';
    //bool? => String
    await http.patch(
      url,
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      // homescreen => data
      Map<String, dynamic> result = json.decode(response.body);
      print(result);
      return resData = result['completed'];
      // make call
    });

    return resData;
  }

  //modify passed variables only and treat other variables Null or Default
  @override
  Future<String> putCompleted(Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    //call back data
    String resData = '';
    //bool? => String
    await http.put(
      url,
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      // homescreen => data
      Map<String, dynamic> result = json.decode(response.body);
      print(result);
      return resData = result['completed'];
    });
    return resData;
  }

  // post example
  @override
  Future<String> postTodo(Todo todo) async {
    print('${todo.toJson()}');
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    var result = '';
    var response = await http.post(url, body: todo.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }
}
