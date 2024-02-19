import 'package:todo_list/features/add_todo/add_todo.dart';
import 'package:todo_list/features/todo_list/todo_list.dart';

final routes = {
  '/': (context) => const TodoListPage(),
  '/todo': (context) => const AddTodoPage(),
};