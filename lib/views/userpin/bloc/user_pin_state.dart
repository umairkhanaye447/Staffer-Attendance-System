part of 'user_pin_bloc.dart';

sealed class UserPinState extends Equatable {
  const UserPinState();
}

final class UserPinInitial extends UserPinState {
  const UserPinInitial();
  @override
  List<Object> get props => [];
}

final class UserPinLoadingState extends UserPinState {
  const UserPinLoadingState();
  @override
  List<Object> get props => [];
}

final class UserPinCompletedState extends UserPinState {
  final String id;
  // final List<AttendanceRecord> attendanceData;

  const UserPinCompletedState({required this.id
      // required this.attendanceData,
      });
  @override
  List<Object> get props => [id];
}

final class UserPinErrorState extends UserPinState {
  final String error;
  const UserPinErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

final class LogoutState extends UserPinState {
  @override
  List<Object> get props => [];
}
