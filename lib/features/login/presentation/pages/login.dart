import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testproject/core/network/di/di.dart';
import 'package:testproject/core/utils/colors.dart';
import 'package:testproject/features/login/presentation/bloc/login_bloc.dart';
import 'package:testproject/features/login/presentation/widgets/button.dart';
import 'package:testproject/features/login/presentation/widgets/new_account.dart';
import 'package:testproject/features/login/presentation/widgets/text_field.dart';
import 'package:testproject/features/login/presentation/widgets/title_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginBloc bloc;
  @override
  void initState() {
    bloc = getIt<LoginBloc>();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close(); // بستن بلوک در هنگام خارج شدن از صفحه
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // از بسته شدن صفحه جلوگیری می‌کند
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          // کاربر دکمه برگشت را فشار داده است
          return; // به هیچ صفحه‌ای نروید
        }
      },

      child: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.go('/todo');
            }
            if (state is DataError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Center(
                    child: Text(
                      state.message ?? 'Error',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.white,
                ),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: BACKGROUND_GRAY_COLOR_ICON.withValues(alpha: .5),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TitlePage(),
                    // const SizedBox(height: 20),
                    TextFieldWidget(
                      labelText: 'Username',
                      onChanged: (value) {
                        bloc.username = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      labelText: 'password',
                      onChanged: (value) {
                        bloc.password = value;
                      },
                    ),
                    NewAccount(),
                    const SizedBox(height: 20),
                    WidgetButton(bloc: bloc),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
