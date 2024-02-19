part of 'todo_list_bloc.dart';

class TodoListEvent {}

class LoadTodoListEvent extends TodoListEvent {}


class DeleteTodoEvent extends TodoListEvent {
  final int index;

  DeleteTodoEvent({required this.index});
}

class TodoListAddEvent extends TodoListEvent {
  final Todo todo;

  TodoListAddEvent({required this.todo});
}