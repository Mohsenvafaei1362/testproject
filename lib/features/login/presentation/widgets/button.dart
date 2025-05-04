import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/core/extentions/extention.dart';
import 'package:testproject/core/utils/colors.dart';
import 'package:testproject/features/login/domain/usecase/login_usecase.dart';
import 'package:testproject/features/login/presentation/bloc/login_bloc.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({super.key, this.title, this.bloc});
  final String? title;
  final LoginBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenwidth * 0.45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF8AB2A6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
        onPressed: () {
          if (bloc?.username != null &&
              bloc!.username!.length > 3 &&
              bloc?.password != null &&
              bloc!.password!.length > 3) {
            bloc?.add(
              Login(
                params: LoginParams(
                  username: bloc?.username ?? '',
                  password: bloc?.password ?? '',
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Please enter valid username and password',
                  style: TextStyle(color: Colors.red),
                ),
                duration: const Duration(seconds: 2),
                backgroundColor: CULTURED_1,
              ),
            );
          }
        },
        child:
            bloc?.state is LoginLoading
                ? CupertinoActivityIndicator(color: Colors.white)
                : Text(
                  title ?? 'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
      ),
    );
  }
}
