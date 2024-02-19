import 'package:hive_flutter/adapters.dart';
import 'package:todo_list/models/models.dart';

import 'todo_list_repository.dart';

class TodoListRepositoryImpl implements TodoListRepository {

  final Box<Todo> todoListBox;

  TodoListRepositoryImpl({ required this.todoListBox });

  @override
  Future<void> createTodoList(Todo todo) async {
    await todoListBox.add(todo);
  }

  @override
  List<Todo> readTodoList() {
    final List<Todo> todoList = todoListBox.values.toList();
    return todoList;
  }

  @override
  Future<void> deleteTodoList(int index) async {
    await todoListBox.deleteAt(index);
  }

  @override
  Future<void> updateTodoList(Todo todo) async {
    await todoListBox.add(todo);
  }



}