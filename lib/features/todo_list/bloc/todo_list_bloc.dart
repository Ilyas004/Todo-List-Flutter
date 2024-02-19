import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/models/models.dart';
import 'package:todo_list/repositories/todo_list_repository.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState()) {

    on<LoadTodoListEvent>((event, emit) {
      final todoList = GetIt.I<TodoListRepository>().readTodoList();
      emit(state.copyWith(todoList: todoList));
    });

    on<DeleteTodoEvent>((event, emit) async {
      await GetIt.I<TodoListRepository>().deleteTodoList(event.index);
      final updatedTodoList = List<Todo>.from(state.todoList);
      updatedTodoList.removeAt(event.index);
      emit(state.copyWith(todoList: updatedTodoList));
    });

    on<TodoListAddEvent>((event, emit) {
      final updateTodoList = List<Todo>.from(state.todoList);
      updateTodoList.add(event.todo);
      emit(state.copyWith(todoList: updateTodoList));
    });
  }

}
