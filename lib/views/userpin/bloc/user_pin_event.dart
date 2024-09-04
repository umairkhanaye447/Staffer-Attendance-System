part of 'user_pin_bloc.dart';

sealed class UserPinEvent extends Equatable {
  const UserPinEvent();
}

class SubmitUserIdEvent extends UserPinEvent {
  final String UserID;

  const SubmitUserIdEvent({
    required this.UserID,
  });
  @override
  List<Object> get props => [UserID];
}

class LogoutButtonPressEvent extends UserPinEvent {
  LogoutButtonPressEvent();
  @override
  List<Object> get props => [];
}
