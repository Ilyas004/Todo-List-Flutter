import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/repositories/todo_list_repository.dart';

import '../../../models/models.dart';

part 'add_todo_event.dart';
part 'add_todo_state.dart';

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  AddTodoBloc() : super(AddTodoInitial()) {
    on<CreateTodo>((event, emit) async {
      await GetIt.I<TodoListRepository>().createTodoList(event.todo);
    });
  }
}
