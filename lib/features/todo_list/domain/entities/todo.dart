import 'package:flutter/material.dart';

class Todo {
  final String? title;
  bool? isCompleted;
  final String? time;
  final Widget? widget;

  Todo({this.title, this.isCompleted, this.time, this.widget});
}
