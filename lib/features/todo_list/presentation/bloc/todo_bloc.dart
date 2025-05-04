import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:testproject/features/todo_list/domain/entities/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

@injectable
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  String? taskName = '';
  final List<Todo> todo = [
    Todo(
      isCompleted: true,
      time: '12:00',
      title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      widget: Checkbox(value: false, onChanged: (value) {}),
    ),
    Todo(
      isCompleted: false,
      time: '12:00',
      title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      widget: Checkbox(value: false, onChanged: (value) {}),
    ),
  ];
  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
