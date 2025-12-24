import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/model/todo_entity.dart';
import 'package:task/screen/todo_detail_page.dart';
import 'package:task/widget/add-todo.dart';
import 'package:task/widget/todo_list.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  bool isFavorite = false;
  List<ToDoEntity> todoList = [];

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    description.dispose();
  }

  void saveTodo(bool isFavorite) {
    setState(() {
      String uid = Uuid().v4();
      ToDoEntity newTodo = ToDoEntity(
        title: title.text,
        isDone: false,
        uid: uid,
        description: description.text,
        isFavorite: isFavorite,
      );
      todoList.add(newTodo);
      title.clear();
      description.clear();
    });
  }

  void saveTodoV2() {
    setState(() {
      String uid = Uuid().v4();
      ToDoEntity newTodo = ToDoEntity(
        title: title.text,
        isDone: false,
        uid: uid,
        description: description.text,
        isFavorite: isFavorite,
      );
      todoList.add(newTodo);
      title.clear();
      description.clear();
    });
  }

  void onchange(bool value) {
    setState(() {
      isFavorite = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(centerTitle: true, title: Text("승호's Tasks")),
        body: todoList.length == 0
            ? Container(
                padding: EdgeInsetsGeometry.all(20),
                margin: EdgeInsetsGeometry.all(20),
                width: double.infinity,
                height: 225,
                decoration: BoxDecoration(
                  color: Color.fromARGB(219, 224, 224, 224),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      width: 80,
                      height: 80,
                      "assets/icon/add-file-icon.svg",
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "아직 할 일이 없음",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "할 일을 추가하고 태현's Tasks에서\n 할 일을 추적하세요.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  // return Container(
                  //   margin: const EdgeInsets.symmetric(
                  //     horizontal: 16,
                  //     vertical: 8,
                  //   ),
                  //   padding: const EdgeInsets.all(16),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(12),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.05),
                  //         blurRadius: 10,
                  //         offset: const Offset(0, 2),
                  //       ),
                  //     ],
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             todoList[index] = todoList[index].copyWith(
                  //               isDone: !todoList[index].isDone,
                  //             );
                  //           });
                  //         },
                  //         child: Icon(
                  //           todoList[index].isDone
                  //               ? Icons.check_circle
                  //               : Icons.circle_outlined,
                  //           color: todoList[index].isDone
                  //               ? Colors.blue
                  //               : Colors.grey.shade400,
                  //           size: 24,
                  //         ),
                  //       ),
                  //       const SizedBox(width: 12),
                  //       Expanded(
                  //         child: InkWell(
                  //           onTap: () {
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => TodoDetailPage(
                  //                   title: todoList[index].title,
                  //                   description: todoList[index].description!,
                  //                   isDone: todoList[index].isDone,
                  //                   isFavorite: todoList[index].isFavorite,
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //           child: Text(
                  //             todoList[index].title,
                  //             style: TextStyle(
                  //               fontSize: 16,
                  //               color: todoList[index].isDone
                  //                   ? Colors.grey
                  //                   : Colors.black87,
                  //               decoration: todoList[index].isDone
                  //                   ? TextDecoration.lineThrough
                  //                   : TextDecoration.none,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       todoList[index].isFavorite
                  //           ? Icon(Icons.star, color: Colors.black87, size: 24)
                  //           : Icon(Icons.star_border, size: 24),
                  //     ],
                  //   ),
                  // );
                  return TodoListWidget(
                    todo: todoList[index],
                    onTodoToggle: () {
                      setState(() {
                        todoList[index] = todoList[index].copyWith(
                          isDone: !todoList[index].isDone,
                        );
                      });
                    },
                    onTodoTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodoDetailPage(
                            title: todoList[index].title,
                            description: todoList[index].description ?? '',
                            isDone: todoList[index].isDone,
                            isFavorite: todoList[index].isFavorite,
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemCount: todoList.length,
              ),

        // floatingActionButton: addTodo(
        //   context,
        //   formKey,
        //   title,
        //   description,
        //   false,
        //   saveTodo,
        // ),
        floatingActionButton: AddTodo(
          formKey: formKey,
          title: title,
          description: description,
          isFavorite: isFavorite,
          onchangeFavorite: onchange,
          saveto: saveTodoV2,
        ),
      ),
    );
  }
}
