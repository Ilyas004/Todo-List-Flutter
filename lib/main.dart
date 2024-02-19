import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list/models/models.dart';
import 'package:todo_list/repositories/todo_list_repository.dart';
import 'package:todo_list/repositories/todo_list_repository_impl.dart';
import 'package:todo_list/todo_list_app.dart';



void main() async {

  const todoListBoxName = 'todo_list_box';

  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());

  final todoListBox = await Hive.openBox<Todo>(todoListBoxName);

  GetIt.I.registerLazySingleton<TodoListRepository>(
    () => TodoListRepositoryImpl(todoListBox: todoListBox)
  );

  runApp(const MyApp());
}







