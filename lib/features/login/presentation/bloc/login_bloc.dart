import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:testproject/features/login/domain/entities/response_entities.dart';
import 'package:testproject/features/login/domain/usecase/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  ResponseEntities response = ResponseEntities();
  String? username;
  String? password;

  LoginBloc(this.loginUsecase) : super(LoginInitial()) {
    on<Login>(_login);
  }

  FutureOr<void> _login(Login event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await loginUsecase(event.params);
    result.fold((l) => left(emit(DataError(message: l.message))), (r) {
      response = ResponseEntities(
        accessToken: r.accessToken,
        email: r.email,
        firstName: r.firstName,
        lastName: r.lastName,
        id: r.id,
        image: r.image,
        username: r.username,
      );
      emit(LoginSuccess());
    });
  }
}
