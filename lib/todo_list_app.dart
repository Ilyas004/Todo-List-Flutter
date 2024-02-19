import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/router/router.dart';

import 'features/add_todo/bloc/add_todo_bloc.dart';
import 'features/todo_list/bloc/todo_list_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoListBloc(),
        ),
        BlocProvider(
          create: (context) => AddTodoBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        routes: routes,
      ),
    );
  }
}