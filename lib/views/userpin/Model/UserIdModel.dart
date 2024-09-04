import 'package:equatable/equatable.dart';

class UserIdModel extends Equatable {
  final EmployeeRecord employeeRecord;

  UserIdModel({
    required this.employeeRecord,
  });

  UserIdModel copyWith({
    EmployeeRecord? employeeRecord,
  }) =>
      UserIdModel(
        employeeRecord: employeeRecord ?? this.employeeRecord,
      );

  factory UserIdModel.fromJson(Map<String, dynamic> json) => UserIdModel(
        employeeRecord: EmployeeRecord.fromJson(json["employee_record"]),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [employeeRecord];
}

class EmployeeRecord extends Equatable {
  final int id;
  final String applicantNo;
  final int organizationId;
  final String name;
  final String orgLogo;
  final List<AttendanceRecord> attendance;

  @override
  List<Object?> get props =>
      [applicantNo, attendance, id, organizationId, name, orgLogo, attendance];

  EmployeeRecord({
    required this.id,
    required this.applicantNo,
    required this.organizationId,
    required this.name,
    required this.orgLogo,
    required this.attendance,
  });

  EmployeeRecord copyWith({
    int? id,
    String? applicantNo,
    int? organizationId,
    String? name,
    String? orgLogo,
    List<AttendanceRecord>? attendance,
  }) =>
      EmployeeRecord(
        id: id ?? this.id,
        applicantNo: applicantNo ?? this.applicantNo,
        organizationId: organizationId ?? this.organizationId,
        name: name ?? this.name,
        orgLogo: orgLogo ?? this.orgLogo,
        attendance: attendance ?? this.attendance,
      );

  factory EmployeeRecord.fromJson(Map<String, dynamic> json) => EmployeeRecord(
        id: json["id"] ?? 0,
        applicantNo: json["applicant_no"] ?? '',
        organizationId: json["organization_id"] ?? 0,
        name: json["name"] ?? '',
        orgLogo: json["org_logo"] ?? '',
        attendance: json['attendance'] != null
            ? List<AttendanceRecord>.from(
                json['attendance'].map((e) => AttendanceRecord.fromJson(e)))
            : [],
      );
}

class AttendanceRecord extends Equatable {
  final int id;
  final int employeeTimesheetWeeklyId;
  final String rateType;
  final String? startTime;
  final String? endTime;
  final DateTime date;
  final String overtimeHours;
  final String regularHours;
  final dynamic billingRate;
  final dynamic overtimeBillingRate;
  final dynamic payRate;
  final dynamic overtimePayRate;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final List<BreakTime> breakTimes;

  const AttendanceRecord({
    required this.id,
    required this.employeeTimesheetWeeklyId,
    required this.rateType,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.overtimeHours,
    required this.regularHours,
    required this.billingRate,
    required this.overtimeBillingRate,
    required this.payRate,
    required this.overtimePayRate,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.startDateTime,
    required this.endDateTime,
    required this.breakTimes,
  });

  AttendanceRecord copyWith({
    int? id,
    int? employeeTimesheetWeeklyId,
    String? rateType,
    String? startTime,
    String? endTime,
    DateTime? date,
    String? overtimeHours,
    String? regularHours,
    dynamic billingRate,
    dynamic overtimeBillingRate,
    dynamic payRate,
    dynamic overtimePayRate,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? startDateTime,
    DateTime? endDateTime,
    List<BreakTime>? breakTimes,
  }) =>
      AttendanceRecord(
        id: id ?? this.id,
        employeeTimesheetWeeklyId:
            employeeTimesheetWeeklyId ?? this.employeeTimesheetWeeklyId,
        rateType: rateType ?? this.rateType,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        date: date ?? this.date,
        overtimeHours: overtimeHours ?? this.overtimeHours,
        regularHours: regularHours ?? this.regularHours,
        billingRate: billingRate ?? this.billingRate,
        overtimeBillingRate: overtimeBillingRate ?? this.overtimeBillingRate,
        payRate: payRate ?? this.payRate,
        overtimePayRate: overtimePayRate ?? this.overtimePayRate,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        startDateTime: startDateTime ?? this.startDateTime,
        endDateTime: endDateTime ?? this.endDateTime,
        breakTimes: breakTimes ?? this.breakTimes,
      );

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      AttendanceRecord(
        id: json["id"] ?? 0,
        employeeTimesheetWeeklyId: json["employee_timesheet_weekly_id"] ?? 0,
        rateType: json["rate_type"] ?? '',
        startTime: json["start_time"] ?? '',
        endTime: json["end_time"] ?? '',
        date: DateTime.parse(json["date"]),
        overtimeHours: json["overtime_hours"] ?? '',
        regularHours: json["regular_hours"] ?? '',
        billingRate: json["billing_rate"] ?? '',
        overtimeBillingRate: json["overtime_billing_rate"] ?? '',
        payRate: json["pay_rate"] ?? '',
        overtimePayRate: json["overtime_pay_rate"] ?? '',
        deletedAt: json["deleted_at"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        startDateTime: DateTime.parse(json["start_date_time"]),
        endDateTime: json["end_date_time"] == null
            ? null
            : DateTime.parse(json["end_date_time"]),
        breakTimes: json["break_times"] == null
            ? []
            : List<BreakTime>.from(
                json["break_times"].map((x) => BreakTime.fromJson(x))),
      );

  @override
  List<Object?> get props => [
        id,
        employeeTimesheetWeeklyId,
        rateType,
        startTime,
        endTime,
        date,
        overtimeHours,
        regularHours,
        billingRate,
        overtimeBillingRate,
        deletedAt,
        regularHours,
        billingRate,
        overtimePayRate,
        deletedAt,
        createdAt,
        updatedAt,
        startDateTime,
        endDateTime,
        breakTimes
      ];
}

class BreakTime {
  final int id;
  final int employeeTimesheetDailyId;
  final String startTime;
  final String endTime;
  final String duration;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? startBreakTime;
  final DateTime? endBreakTime;

  BreakTime({
    required this.id,
    required this.employeeTimesheetDailyId,
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.startBreakTime,
    required this.endBreakTime,
  });

  BreakTime copyWith({
    int? id,
    int? employeeTimesheetDailyId,
    String? startTime,
    String? endTime,
    String? duration,
    DateTime? date,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? startBreakTime,
    DateTime? endBreakTime,
  }) =>
      BreakTime(
        id: id ?? this.id,
        employeeTimesheetDailyId:
            employeeTimesheetDailyId ?? this.employeeTimesheetDailyId,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        duration: duration ?? this.duration,
        date: date ?? this.date,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        startBreakTime: startBreakTime ?? this.startBreakTime,
        endBreakTime: endBreakTime ?? this.endBreakTime,
      );

  factory BreakTime.fromJson(Map<String, dynamic> json) => BreakTime(
        id: json["id"] ?? 0,
        employeeTimesheetDailyId: json["employee_timesheet_daily_id"] ?? 0,
        startTime: json["start_time"] ?? '',
        endTime: json["end_time"] ?? '',
        duration: json["duration"] ?? '',
        date: DateTime.parse(json["date"] ?? '1970-01-01'),
        createdAt: DateTime.parse(json["created_at"] ?? '1970-01-01'),
        updatedAt: DateTime.parse(json["updated_at"] ?? '1970-01-01'),
        startBreakTime: json["start_break_time"] == null
            ? null
            : DateTime.parse(json["start_break_time"]),
        endBreakTime: json["end_break_time"] != null
            ? DateTime.parse(json["end_break_time"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_timesheet_daily_id": employeeTimesheetDailyId,
        "start_time": startTime,
        "end_time": endTime,
        "duration": duration,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "start_break_time": startBreakTime!.toIso8601String(),
        "end_break_time": endBreakTime!.toIso8601String(),
      };
}
