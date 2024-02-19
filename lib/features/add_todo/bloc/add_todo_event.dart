part of 'add_todo_bloc.dart';

@immutable
abstract class AddTodoEvent {}

class CreateTodo extends AddTodoEvent {
  final Todo todo;

  CreateTodo({required this.todo,});
}

