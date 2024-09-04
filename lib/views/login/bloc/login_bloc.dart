import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeclock/views/login/NetworkCalls/login_network_calls.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginEvent>(loginstate);
  }

  Future<void> loginstate(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginButtonPressedEvent) {
      emit(const LoginLoadingState());
      try {
        var loginResponse = await Login_NetworkCall.login(
          email: event.email,
          password: event.password,
        );
        if (loginResponse.statusCode == 200) {
          var loginjson = jsonDecode(loginResponse.body);
          if (loginjson["token"] != null) {
            SharedPreferences p = await SharedPreferences.getInstance();
            await p.setString('token', loginjson['token']);
            await p.setString('loginPassword', event.password);
            await p.setBool('isLoggedIn', true);

            emit(const LoginLoadedState());
          } else {
            print('Your token is not correct');
            emit(const LoginErrorState(error: 'Token is not valid'));
          }
        } else {
          emit(const LoginErrorState(error: 'Status code is not 200'));
        }
      } catch (e) {
        print(e.toString());
        emit(LoginErrorState(error: e.toString()));
      }
    }
  }
}
