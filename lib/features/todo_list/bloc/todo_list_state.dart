part of 'todo_list_bloc.dart';

class TodoListState {
  List<Todo> todoList;

  TodoListState({
    this.todoList = const []
  });

  TodoListState copyWith({
    List<Todo>? todoList
  }) {
    return TodoListState(todoList: todoList ?? this.todoList);
  }
}

