import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeclock/views/home/NetworkCall/HomeNetworkCall.dart';
import 'package:timeclock/views/userpin/Model/NetworkCall.dart';
import 'package:timeclock/views/userpin/Model/UserIdModel.dart';

part 'check_in_chck_out_event.dart';
part 'check_in_chck_out_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(AttendanceInitial()) {
    on<SendCheckInEvent>(_onSendCheckInEvent);
    on<LoadInitialUserData>(_loadInitialUserData);
    on<SendCheckOutEvent>(_onSendCheckOutEvent);
    on<SendBreakStartEvent>(_onSendBreakStartEvent);
    on<SendBreakEndEvent>(_onSendBreakEndEvent);
  }

  Future<void> _onSendCheckInEvent(
    SendCheckInEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    await _sendAttendanceData(
      id: event.employeeId,
      body: {
        'key': 'check_in',
        'time': event.checkInTime,
        'employee_id': event.employeeId.toString(),
      },
      emit: emit,
    );
  }

  Future<void> _onSendCheckOutEvent(
    SendCheckOutEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    await _sendAttendanceData(
      id: event.employeeId,
      body: {
        'key': 'check_out',
        'time': event.checkOutTime,
        'employee_id': event.employeeId.toString(),
      },
      emit: emit,
    );
  }

  Future<void> _onSendBreakStartEvent(
    SendBreakStartEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    await _sendAttendanceData(
      id: event.employeeId,
      body: {
        'key': 'break_start',
        'time': event.breakStartTime,
        'employee_id': event.employeeId.toString(),
      },
      emit: emit,
    );
  }

  Future<void> _onSendBreakEndEvent(
    SendBreakEndEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    await _sendAttendanceData(
      id: event.employeeId,
      body: {
        'key': 'break_end',
        'time': event.breakEndTime,
        'employee_id': event.employeeId.toString(),
      },
      emit: emit,
    );
  }

  Future<void> _sendAttendanceData({
    required Map<String, String> body,
    required Emitter<AttendanceState> emit,
    required int id,
  }) async {
    emit(AttendanceLoading());
    try {
      SharedPreferences p = await SharedPreferences.getInstance();
      var token = p.getString('token') ?? '';
      log('Token: $token');

      final response = await HomeNetworkCall.sendAttendanceData(token, body);
      log('Attendance Response: $response');

      if (response.containsKey('success')) {
        try {
          var userIdResponse =
              await UserIdNetworkCall.userIdData(token, id.toString());
          log('UserId Response: $userIdResponse');

          if (userIdResponse.containsKey('employee_record')) {
            UserIdModel userIdModel = UserIdModel.fromJson(userIdResponse);
            var desc = await availableCameras();
            var ctrl = CameraController(desc[0], ResolutionPreset.max);
            await ctrl.initialize();
            emit(AttendanceSuccess(
                cameraController: ctrl,
                successMessage: response['success'],
                userIdModel: userIdModel));
          } else {
            emit(AttendanceFailure(error: 'User data not found.'));
          }
        } catch (e) {
          emit(AttendanceFailure(error: e.toString()));
        }
      } else {
        emit(AttendanceFailure(
            error: response['error'] ?? 'Failed to send data.'));
      }
    } catch (e) {
      emit(AttendanceFailure(error: e.toString()));
    }
  }

  FutureOr<void> _loadInitialUserData(
      LoadInitialUserData event, Emitter<AttendanceState> emit) async {
    emit(AttendanceLoading());
    try {
      SharedPreferences p = await SharedPreferences.getInstance();
      var token = p.getString('token') ?? '';

      var userIdResponse = await UserIdNetworkCall.userIdData(
          token, event.employeeId.toString());
      log(userIdResponse.toString());
      if (userIdResponse.containsKey('employee_record')) {
        UserIdModel userIdModel = UserIdModel.fromJson(userIdResponse);
        var desc = await availableCameras();
        var ctrl = CameraController(desc[0], ResolutionPreset.max);
        await ctrl.initialize();

        emit(AttendanceSuccess(
            cameraController: ctrl,
            successMessage: "User data received Successfully",
            userIdModel: userIdModel));
      } else {
        emit(AttendanceFailure(error: 'Failed to send data.'));
      }
    } catch (e) {
      emit(AttendanceFailure(error: e.toString()));
    }
  }
}
