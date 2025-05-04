import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testproject/features/login/presentation/pages/login.dart';
import 'package:testproject/features/register/presentation/pages/register.dart';
import 'package:testproject/features/todo_list/presentation/pages/add_todo.dart';
import 'package:testproject/features/todo_list/presentation/pages/todo_list.dart';

class RouterPage {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const Login(),
              transitionDuration: const Duration(milliseconds: 800),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
            ),
      ),
      GoRoute(
        path: '/register',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const Register(),
              transitionDuration: const Duration(milliseconds: 800),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
            ),
      ),
      GoRoute(path: '/todo', builder: (context, state) => const TodoList()),
      GoRoute(path: '/addtodo', builder: (context, state) => const AddTodo()),
    ],
    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text('Error: ${state.error}'))),

    // errorBuilder: (context, state) => const Login(),
    debugLogDiagnostics: true,
  );
}
