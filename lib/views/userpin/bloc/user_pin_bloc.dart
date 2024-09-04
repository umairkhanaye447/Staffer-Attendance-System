  import 'dart:developer';
  import 'package:bloc/bloc.dart';
  import 'package:equatable/equatable.dart';
  import 'package:shared_preferences/shared_preferences.dart';
  import 'package:timeclock/views/userpin/Model/NetworkCall.dart';
  import 'package:timeclock/views/userpin/Model/UserIdModel.dart';

  part 'user_pin_event.dart';
  part 'user_pin_state.dart';

  class UserPinBloc extends Bloc<UserPinEvent, UserPinState> {
    UserPinBloc() : super(const UserPinInitial()) {
      on<SubmitUserIdEvent>(_onSubmitUserIdEvent);
      on<LogoutButtonPressEvent>(logoutstate);
    }

    Future<void> _onSubmitUserIdEvent(
      SubmitUserIdEvent event,
      Emitter<UserPinState> emit,
    ) async {
      emit(const UserPinLoadingState());
      try {
        SharedPreferences p = await SharedPreferences.getInstance();
        var token = await p.getString('token') ?? '';
        log('Token: $token');
        log('User ID: ${event.UserID}');

        var userIdResponse =
            await UserIdNetworkCall.userIdData(token, event.UserID);
        log('User ID Response: $userIdResponse');
        
        if (userIdResponse.containsKey('employee_record')) {
          log('Decoded response body: $userIdResponse');
          
          UserIdModel userIdModel = UserIdModel.fromJson(userIdResponse);
          log('Parsed UserIdModel: ${userIdModel.toString()}');
          
          emit(UserPinCompletedState(
            id: event.UserID,
          ));
        } else {
          log('Error: Invalid User ID');
          emit(const UserPinErrorState(error: 'Invalid User ID'));
        }
      } catch (e) {
        log(e.toString());
        emit(UserPinErrorState(
            error: e.toString()));
      }
    }

  Future<void> logoutstate(
      LogoutButtonPressEvent event, Emitter<UserPinState> emit) async {
    emit(LogoutState());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('isLoggedIn');  // Clear the 'isLoggedIn' flag
    } catch (e) {
      emit(UserPinErrorState(error: e.toString()));
    }
  }

  }
