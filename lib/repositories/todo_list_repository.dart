import '../models/models.dart';

abstract class TodoListRepository {

  Future<void> createTodoList(Todo todo);

  List<Todo> readTodoList();

  Future<void> updateTodoList(Todo todo);

  Future<void> deleteTodoList(int index);
}