import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/todo_list/bloc/todo_list_bloc.dart';
import 'package:todo_list/features/todo_list/widgets/widgets.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoListBloc = BlocProvider.of<TodoListBloc>(context)..add(LoadTodoListEvent());
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<TodoListBloc, TodoListState>(
            bloc: todoListBloc,
            builder: (context, state) {
              if (state.todoList.isNotEmpty) {
                return ListView.builder(
                  padding: const EdgeInsets.only(
                      left:   16,
                      right:  16,
                      top:    20,
                      bottom: 30),
                  itemCount: state.todoList.length,
                  itemBuilder: (BuildContext context, index) {
                    return TodoWidget(
                      title: state.todoList[index].title,
                      description: state.todoList[index].description,
                      isActive: state.todoList[index].isActive,
                      onDelete: () {
                        todoListBloc.add(DeleteTodoEvent(index: index));
                      },
                    );

                });
              }
              return const Center(child: Text('Not Todo'),);
            },
          )



      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.of(context).pushNamed('/todo'); },
        child: const Icon(Icons.add),),
    );
  }
}