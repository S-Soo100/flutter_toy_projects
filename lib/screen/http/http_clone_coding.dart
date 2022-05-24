import 'package:flutter/material.dart';
import 'package:my_practice_app/controller/todo_controller.dart';
import 'package:my_practice_app/model/todo.dart';
import 'package:my_practice_app/repository/todo_repository.dart';
import 'package:my_practice_app/widgets/too_lazy_to_make_appbar.dart';

class HttpCloneCoding extends StatelessWidget {
  static String HttpCloneCodingRouteName = 'httpCloneCoding';
  const HttpCloneCoding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //dependency injection
    var todoController = TodoController(TodoRepository());
    //text
    todoController.fetchTodoList();
    return Scaffold(
      appBar: TooLazyToMakeAppbar(context: context, title: 'REST API'),
      body: FutureBuilder<List<Todo>>(
          future: todoController.fetchTodoList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return buildBodyContent(snapshot, todoController);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Todo todo = Todo(userId: 3, title: 'sample post', completed: false);
          todoController.postTodo(todo);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  SafeArea buildBodyContent(
      AsyncSnapshot<List<Todo>> snapshot, TodoController todoController) {
    return SafeArea(
      child: ListView.separated(
          itemBuilder: (context, index) {
            var todo = snapshot.data?[index];
            return Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Text('${todo?.id}')),
                  Expanded(flex: 3, child: Text('${todo?.title}')),
                  Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildCallContainer(
                              title: 'patch',
                              color: Color(0xFFFFE0B2),
                              onTap: () {
                                //make controller method
                                todoController
                                    .updatePatchCompleted(todo!)
                                    .then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          content: Text('$value')));
                                });
                              }),
                          // make put call
                          buildCallContainer(
                              title: 'put',
                              color: Color(0xFFE1BEE7),
                              onTap: () {
                                todoController.updatePutCompleted(todo!);
                              }),
                          buildCallContainer(
                              title: 'del',
                              color: Colors.red[100],
                              onTap: () {
                                todoController.deleteTodo(todo!).then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          content: Text('$value')));
                                });
                              }),
                        ],
                      )),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 0.5,
              height: 0.5,
            );
          },
          itemCount: snapshot.data?.length ?? 0),
    );
  }

  Widget buildCallContainer(
      {required String title, required Color? color, required Function onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
            color: color ?? Colors.orange,
            borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text('$title')),
      ),
    );
  }
}
