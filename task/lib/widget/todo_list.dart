import 'package:flutter/material.dart';
import 'package:task/model/todo_entity.dart';

class TodoListWidget extends StatelessWidget {
  final ToDoEntity todo;
  final VoidCallback onTodoToggle;
  final VoidCallback onTodoTap;

  const TodoListWidget({
    Key? key,
    required this.todo,
    required this.onTodoToggle,
    required this.onTodoTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onTodoToggle,
            child: Icon(
              todo.isDone ? Icons.check_circle : Icons.circle_outlined,
              color: todo.isDone ? Colors.blue : Colors.grey.shade400,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: InkWell(
              onTap: onTodoTap,
              child: Text(
                todo.title,
                style: TextStyle(
                  fontSize: 16,
                  color: todo.isDone ? Colors.grey : Colors.black87,
                  decoration: todo.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
          ),
          Icon(
            todo.isFavorite ? Icons.star : Icons.star_border,
            color: todo.isFavorite ? Colors.black87 : null,
            size: 24,
          ),
        ],
      ),
    );
  }
}
