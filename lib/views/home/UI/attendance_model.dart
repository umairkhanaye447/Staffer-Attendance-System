// // // import 'package:equatable/equatable.dart';

// // // class AttendanceRecord extends Equatable {
// // //   final int id;
// // //   final int employeeId;
// // //   final int organizationId;
// // //   final String type;
// // //   final DateTime? date;
// // //   final DateTime? createdAt;
// // //   final DateTime? updatedAt;
// // //   final int attType;
// // //   final DateTime? breakStart;

// // //   AttendanceRecord({
// // //     required this.id,
// // //     required this.employeeId,
// // //     required this.organizationId,
// // //     required this.type,
// // //     required this.date,
// // //     required this.createdAt,
// // //     required this.updatedAt,
// // //     required this.attType,
// // //     required this.breakStart,
// // //   });

// // //   factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
// // //       AttendanceRecord(
// // //         id: json['id'] ?? "" as int,
// // //         employeeId: json['employee_id'] ?? "" as int,
// // //         organizationId: json['organization_id'] ?? "" as int,
// // //         type: json['type'] ?? "" as String,
// // //         date: json['date'] == null
// // //             ? null
// // //             : DateTime.parse(json['date'] as String),
// // //         createdAt: json['created_at'] == null
// // //             ? null
// // //             : DateTime.parse(json['created_at'] as String),
// // //         updatedAt: json['updated_at'] == null
// // //             ? null
// // //             : DateTime.parse(json['updated_at'] as String),
// // //         attType: json['att_type'] ?? "" as int,
// // //         breakStart: json['break_start'] == null
// // //             ? null
// // //             : DateTime.parse(json['break_start'] as String),
// // //       );

// // //   Map<String, dynamic> toJson() => {
// // //         'id': id,
// // //         'employee_id': employeeId,
// // //         'organization_id': organizationId,
// // //         'type': type,
// // //         'date': date.toString(), // Convert DateTime to String
// // //         'created_at': createdAt.toString(),
// // //         'updated_at': updatedAt.toString(),
// // //         'att_type': attType,
// // //         'break_start': breakStart.toString(),
// // //       };

// // //   @override
// // //   // TODO: implement props
// // //   List<Object?> get props => [
// // //         id,
// // //         employeeId,
// // //         organizationId,
// // //         type,
// // //         date,
// // //         createdAt,
// // //         updatedAt,
// // //         attType,
// // //         breakStart
// // //       ];
// // // }
// // // To parse this JSON data, do
// // //
// // //     final employeeRecord = employeeRecordFromJson(jsonString);

// // import 'package:equatable/equatable.dart';
// // import 'package:meta/meta.dart';
// // import 'dart:convert';

// // AttendanceRecord employeeRecordFromJson(String str) => AttendanceRecord.fromJson(json.decode(str));

// // String employeeRecordToJson(AttendanceRecord data) => json.encode(data.toJson());

// // class AttendanceRecord extends Equatable{
// //     final int id;
// //     final int employeeTimesheetWeeklyId;
// //     final String rateType;
// //     final String startTime;
// //     final dynamic endTime;
// //     final DateTime date;
// //     final String overtimeHours;
// //     final String regularHours;
// //     final dynamic billingRate;
// //     final dynamic overtimeBillingRate;
// //     final dynamic payRate;
// //     final dynamic overtimePayRate;
// //     final dynamic deletedAt;
// //     final DateTime createdAt;
// //     final DateTime updatedAt;
// //     final List<BreakTime> breakTimes;

// //     AttendanceRecord({
// //         required this.id,
// //         required this.employeeTimesheetWeeklyId,
// //         required this.rateType,
// //         required this.startTime,
// //         required this.endTime,
// //         required this.date,
// //         required this.overtimeHours,
// //         required this.regularHours,
// //         required this.billingRate,
// //         required this.overtimeBillingRate,
// //         required this.payRate,
// //         required this.overtimePayRate,
// //         required this.deletedAt,
// //         required this.createdAt,
// //         required this.updatedAt,
// //         required this.breakTimes,
// //     });

// //     AttendanceRecord copyWith({
// //         int? id,
// //         int? employeeTimesheetWeeklyId,
// //         String? rateType,
// //         String? startTime,
// //         dynamic endTime,
// //         DateTime? date,
// //         String? overtimeHours,
// //         String? regularHours,
// //         dynamic billingRate,
// //         dynamic overtimeBillingRate,
// //         dynamic payRate,
// //         dynamic overtimePayRate,
// //         dynamic deletedAt,
// //         DateTime? createdAt,
// //         DateTime? updatedAt,
// //         List<BreakTime>? breakTimes,
// //     }) =>
// //         AttendanceRecord(
// //             id: id ?? this.id,
// //             employeeTimesheetWeeklyId: employeeTimesheetWeeklyId ?? this.employeeTimesheetWeeklyId,
// //             rateType: rateType ?? this.rateType,
// //             startTime: startTime ?? this.startTime,
// //             endTime: endTime ?? this.endTime,
// //             date: date ?? this.date,
// //             overtimeHours: overtimeHours ?? this.overtimeHours,
// //             regularHours: regularHours ?? this.regularHours,
// //             billingRate: billingRate ?? this.billingRate,
// //             overtimeBillingRate: overtimeBillingRate ?? this.overtimeBillingRate,
// //             payRate: payRate ?? this.payRate,
// //             overtimePayRate: overtimePayRate ?? this.overtimePayRate,
// //             deletedAt: deletedAt ?? this.deletedAt,
// //             createdAt: createdAt ?? this.createdAt,
// //             updatedAt: updatedAt ?? this.updatedAt,
// //             breakTimes: breakTimes ?? this.breakTimes,
// //         );

// //     factory AttendanceRecord.fromJson(Map<String, dynamic> json) => AttendanceRecord(
// //         id: json["id"]??0,
// //         employeeTimesheetWeeklyId: json["employee_timesheet_weekly_id"]??0,
// //         rateType: json["rate_type"]??'',
// //         startTime: json["start_time"]??'',
// //         endTime: json["end_time"]??'',
// //         date: DateTime.parse(json["date"]),
// //         overtimeHours: json["overtime_hours"]??'',
// //         regularHours: json["regular_hours"]??'',
// //         billingRate: json["billing_rate"]??'',
// //         overtimeBillingRate: json["overtime_billing_rate"]??'',
// //         payRate: json["pay_rate"]??'',
// //         overtimePayRate: json["overtime_pay_rate"]??'',
// //         deletedAt: json["deleted_at"]??'',
// //         createdAt: DateTime.parse(json["created_at"]),
// //         updatedAt: DateTime.parse(json["updated_at"]),
// //         breakTimes: List<BreakTime>.from(json["break_times"].map((x) => BreakTime.fromJson(x))),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "employee_timesheet_weekly_id": employeeTimesheetWeeklyId,
// //         "rate_type": rateType,
// //         "start_time": startTime,
// //         "end_time": endTime,
// //         "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
// //         "overtime_hours": overtimeHours,
// //         "regular_hours": regularHours,
// //         "billing_rate": billingRate,
// //         "overtime_billing_rate": overtimeBillingRate,
// //         "pay_rate": payRate,
// //         "overtime_pay_rate": overtimePayRate,
// //         "deleted_at": deletedAt,
// //         "created_at": createdAt.toIso8601String(),
// //         "updated_at": updatedAt.toIso8601String(),
// //         "break_times": List<dynamic>.from(breakTimes.map((x) => x.toJson())),
// //     };

// //       @override
// //       // TODO: implement props
// //       List<Object?> get props => [];
// // }

// // class BreakTime {
// //     final int id;
// //     final int employeeTimesheetDailyId;
// //     final dynamic startTime;
// //     final dynamic endTime;
// //     final dynamic duration;
// //     final DateTime date;
// //     final DateTime createdAt;
// //     final DateTime updatedAt;

// //     BreakTime({
// //         required this.id,
// //         required this.employeeTimesheetDailyId,
// //         required this.startTime,
// //         required this.endTime,
// //         required this.duration,
// //         required this.date,
// //         required this.createdAt,
// //         required this.updatedAt,
// //     });

// //     BreakTime copyWith({
// //         int? id,
// //         int? employeeTimesheetDailyId,
// //         dynamic startTime,
// //         dynamic endTime,
// //         dynamic duration,
// //         DateTime? date,
// //         DateTime? createdAt,
// //         DateTime? updatedAt,
// //     }) =>
// //         BreakTime(
// //             id: id ?? this.id,
// //             employeeTimesheetDailyId: employeeTimesheetDailyId ?? this.employeeTimesheetDailyId,
// //             startTime: startTime ?? this.startTime,
// //             endTime: endTime ?? this.endTime,
// //             duration: duration ?? this.duration,
// //             date: date ?? this.date,
// //             createdAt: createdAt ?? this.createdAt,
// //             updatedAt: updatedAt ?? this.updatedAt,
// //         );

// //     factory BreakTime.fromJson(Map<String, dynamic> json) => BreakTime(
// //         id: json["id"],
// //         employeeTimesheetDailyId: json["employee_timesheet_daily_id"],
// //         startTime: json["start_time"],
// //         endTime: json["end_time"],
// //         duration: json["duration"],
// //         date: DateTime.parse(json["date"]),
// //         createdAt: DateTime.parse(json["created_at"]),
// //         updatedAt: DateTime.parse(json["updated_at"]),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "employee_timesheet_daily_id": employeeTimesheetDailyId,
// //         "start_time": startTime,
// //         "end_time": endTime,
// //         "duration": duration,
// //         "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
// //         "created_at": createdAt.toIso8601String(),
// //         "updated_at": updatedAt.toIso8601String(),
// //     };
// // }

// // To parse this JSON data, do
// //
// //     final attendanceModel = attendanceModelFromJson(jsonString);

// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'dart:convert';

// AttendanceRecordModel attendanceModelFromJson(String str) =>
//     AttendanceRecordModel.fromJson(json.decode(str));

// String attendanceModelToJson(AttendanceRecordModel data) =>
//     json.encode(data.toJson());

// class AttendanceRecordModel extends Equatable {
//   final int id;
//   final int employeeTimesheetWeeklyId;
//   final String rateType;
//   final String startTime;
//   final dynamic endTime;
//   final DateTime date;
//   final String overtimeHours;
//   final String regularHours;
//   final dynamic billingRate;
//   final dynamic overtimeBillingRate;
//   final dynamic payRate;
//   final dynamic overtimePayRate;
//   final dynamic deletedAt;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final DateTime startDateTime;
//   final List<dynamic> breakTimes;

//   AttendanceRecordModel({
//     required this.id,
//     required this.employeeTimesheetWeeklyId,
//     required this.rateType,
//     required this.startTime,
//     required this.endTime,
//     required this.date,
//     required this.overtimeHours,
//     required this.regularHours,
//     required this.billingRate,
//     required this.overtimeBillingRate,
//     required this.payRate,
//     required this.overtimePayRate,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.startDateTime,
//     required this.breakTimes,
//   });

//   AttendanceRecordModel copyWith({
//     int? id,
//     int? employeeTimesheetWeeklyId,
//     String? rateType,
//     String? startTime,
//     dynamic endTime,
//     DateTime? date,
//     String? overtimeHours,
//     String? regularHours,
//     dynamic billingRate,
//     dynamic overtimeBillingRate,
//     dynamic payRate,
//     dynamic overtimePayRate,
//     dynamic deletedAt,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     DateTime? startDateTime,
//     List<dynamic>? breakTimes,
//   }) =>
//       AttendanceRecordModel(
//         id: id ?? this.id,
//         employeeTimesheetWeeklyId:
//             employeeTimesheetWeeklyId ?? this.employeeTimesheetWeeklyId,
//         rateType: rateType ?? this.rateType,
//         startTime: startTime ?? this.startTime,
//         endTime: endTime ?? this.endTime,
//         date: date ?? this.date,
//         overtimeHours: overtimeHours ?? this.overtimeHours,
//         regularHours: regularHours ?? this.regularHours,
//         billingRate: billingRate ?? this.billingRate,
//         overtimeBillingRate: overtimeBillingRate ?? this.overtimeBillingRate,
//         payRate: payRate ?? this.payRate,
//         overtimePayRate: overtimePayRate ?? this.overtimePayRate,
//         deletedAt: deletedAt ?? this.deletedAt,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         startDateTime: startDateTime ?? this.startDateTime,
//         breakTimes: breakTimes ?? this.breakTimes,
//       );

//   factory AttendanceRecordModel.fromJson(Map<String, dynamic> json) =>
//       AttendanceRecordModel(
//         id: json["id"],
//         employeeTimesheetWeeklyId: json["employee_timesheet_weekly_id"],
//         rateType: json["rate_type"],
//         startTime: json["start_time"],
//         endTime: json["end_time"],
//         date: DateTime.parse(json["date"]),
//         overtimeHours: json["overtime_hours"],
//         regularHours: json["regular_hours"],
//         billingRate: json["billing_rate"],
//         overtimeBillingRate: json["overtime_billing_rate"],
//         payRate: json["pay_rate"],
//         overtimePayRate: json["overtime_pay_rate"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         startDateTime: DateTime.parse(json["start_date_time"]),
//         breakTimes: List<dynamic>.from(json["break_times"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "employee_timesheet_weekly_id": employeeTimesheetWeeklyId,
//         "rate_type": rateType,
//         "start_time": startTime,
//         "end_time": endTime,
//         "date":
//             "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//         "overtime_hours": overtimeHours,
//         "regular_hours": regularHours,
//         "billing_rate": billingRate,
//         "overtime_billing_rate": overtimeBillingRate,
//         "pay_rate": payRate,
//         "overtime_pay_rate": overtimePayRate,
//         "deleted_at": deletedAt,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "start_date_time": startDateTime.toIso8601String(),
//         "break_times": List<dynamic>.from(breakTimes.map((x) => x)),
//       };

//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         id,
//         employeeTimesheetWeeklyId,
//         rateType,
//         startTime,
//         endTime,
//         date,
//         overtimeHours,
//         regularHours,
//         billingRate,
//         overtimeBillingRate,
//         payRate,
//         overtimePayRate,
//         deletedAt,
//         createdAt,
//         updatedAt,
//         startDateTime,
//         breakTimes
//       ];
// }
