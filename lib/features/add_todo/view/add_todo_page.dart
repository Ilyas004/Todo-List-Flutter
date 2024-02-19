import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/add_todo/bloc/add_todo_bloc.dart';
import 'package:todo_list/features/add_todo/widgets/widgets.dart';
import 'package:todo_list/features/todo_list/bloc/todo_list_bloc.dart';
import 'package:todo_list/models/models.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addTodoBloc = BlocProvider.of<AddTodoBloc>(context);
    return Scaffold(
      body: BlocBuilder<AddTodoBloc, AddTodoState>(
        builder: (context, state) {
          return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 16, right: 16),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _titleController,
                      hintText: 'Title',),
                    const SizedBox(height: 14,),
                    CustomTextField(
                      controller: _descriptionController,
                      hintText: 'Description',),
                  ],
                ),
              )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodo(
              context: context,
              todo: Todo(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  isActive: false)
          );
        },
        child: const Icon(Icons.done),),
    );
  }

  void _addTodo({required BuildContext context, required Todo todo}) {
     context.read<AddTodoBloc>().add(CreateTodo(todo: todo));
     context.read<TodoListBloc>().add(TodoListAddEvent(todo: todo));
     Navigator.of(context).pop();
  }
}
