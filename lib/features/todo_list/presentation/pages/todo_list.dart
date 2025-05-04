import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Todo List Page', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Switch(
              value: isDark,
              onChanged: (value) {
                EasyDynamicTheme.of(context).changeTheme(dark: value);
                setState(() {
                  isDark = !isDark;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Add your button action here
              },
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
