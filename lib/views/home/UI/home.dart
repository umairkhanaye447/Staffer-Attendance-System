import 'package:auto_size_text/auto_size_text.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:timeclock/views/home/UI/widgets/PunchOut_time_widget.dart';
import 'package:timeclock/views/home/UI/widgets/break_end_button.dart';
import 'package:timeclock/views/home/UI/widgets/break_start_button.dart';
import 'package:timeclock/views/home/UI/widgets/breakStartWidget.dart';
import 'package:timeclock/views/home/UI/widgets/camera_widget.dart';
import 'package:timeclock/views/home/UI/widgets/date_container.dart';
import 'package:timeclock/views/home/UI/widgets/profile_info_widget.dart';
import 'package:timeclock/views/home/UI/widgets/punchIn_time_noted.dart';
import 'package:timeclock/views/home/UI/widgets/punch_in_button.dart';
import 'package:timeclock/views/home/UI/widgets/punch_out_button.dart';
import 'package:timeclock/views/home/bloc/check_in_chck_out_bloc.dart';

class Home extends StatefulWidget {
  final String idd;

  Home({
    Key? key,
    required this.idd,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CameraController _cameraController;
  bool _isCameraInitialized = false;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );
    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.high,
    );
    await _cameraController.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    var attendanceBloc = context.read<AttendanceBloc>();
    attendanceBloc.add(LoadInitialUserData(employeeId: int.parse(widget.idd)));
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  // DateTime getBreakStartTime(BreakTime record) {
  //   return convertHHMMSStoDatetime(record.startTime);
  // }

  // DateTime getBreakEndTime(BreakTime record) {
  //   return convertHHMMSStoDatetime(record.endTime);
  // }

  // DateTime convertHHMMSStoDatetime(String hhmmss) {
  //   DateTime time = DateFormat("HH:mm:ss").parse(hhmmss);
  //   return time;
  // }

  // List<String> getTotalTime(List<DateTime> start, List<DateTime> end) {
  //   List<String> diff = [];
  //   if (start.isNotEmpty && end.isNotEmpty) {
  //     for (int i = 0; i < start.length; i++) {
  //       if (i < end.length) {
  //         diff.add(formatDuration(end[i].difference(start[i])));
  //       }
  //     }
  //   }

  //   return diff;
  // }

// Helper method to format the Duration object into "HH:mm:ss"
  // String formatDuration(Duration duration) {
  //   String twoDigits(int n) => n.toString().padLeft(2, '0');
  //   String hours = twoDigits(duration.inHours.remainder(24));
  //   String minutes = twoDigits(duration.inMinutes.remainder(60));
  //   String seconds = twoDigits(duration.inSeconds.remainder(60));
  //   return "$hours:$minutes:$seconds";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   centerTitle: true,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 5.0),
      //     child: IconButton(
      //       icon: const Row(
      //         children: [
      //           Icon(
      //             Icons.arrow_back_ios,
      //             color: Colors.black,
      //           ),
      //         ],
      //       ),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //   ),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white,
              Color.fromARGB(255, 164, 243, 205),
            ],
          ),
        ),
        child: BlocConsumer<AttendanceBloc, AttendanceState>(
            listener: (context, state) {
          if (state is AttendanceFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to send data: ${state.error}')),
            );
          }
          if (state is AttendanceSuccess) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(content: Text('Data saved')),
            // );
            // Navigate to UserpinScreen after success
          }
        }, builder: (context, state) {
          return BlurryModalProgressHUD(
            inAsyncCall: state is AttendanceLoading ? true : false,
            blurEffectIntensity: 4,
            progressIndicator: const SpinKitFadingCircle(
              color: Colors.greenAccent,
              size: 50.0,
            ),
            dismissible: false,
            opacity: 0.4,
            color: Colors.transparent,
            child: state is AttendanceFailure
                ? Center(child: Text(state.error))
                : state is AttendanceSuccess
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.54,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      IconButton(
                                        icon: const Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_back_ios,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            14, 0, 14, 0),
                                        child: SvgPicture.asset(
                                            'imagesvg/logo.svg'),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),
                                      Date_containerWidget(
                                        now: DateTime.now(),
                                        formattedDate:
                                            DateFormat('EEEE, MMMM d, yyyy')
                                                .format(DateTime.now()),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),
                                      ProfileInfoWidget(
                                          employeeRecord:
                                              state.userIdModel.employeeRecord),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Divider(
                                            thickness: 2,
                                            color: Color.fromRGBO(
                                                199, 234, 215, 100)),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),
                                      PunchInTimeNoted(
                                        starttime: state
                                                .userIdModel
                                                .employeeRecord
                                                .attendance
                                                .isNotEmpty
                                            ? state
                                                    .userIdModel
                                                    .employeeRecord
                                                    .attendance
                                                    .first
                                                    .startTime ??
                                                '--'
                                            : '--',
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 14),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: const AutoSizeText(
                                                'BREAKS',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      52, 60, 68, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                if (state
                                                    .userIdModel
                                                    .employeeRecord
                                                    .attendance
                                                    .isNotEmpty)
                                                  BreakWidget(
                                                      breakList: state
                                                          .userIdModel
                                                          .employeeRecord
                                                          .attendance
                                                          .first
                                                          .breakTimes),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      PunchOutTimeWidget(
                                        offtime: state
                                                    .userIdModel
                                                    .employeeRecord
                                                    .attendance
                                                    .isNotEmpty &&
                                                state
                                                        .userIdModel
                                                        .employeeRecord
                                                        .attendance
                                                        .first
                                                        .endTime !=
                                                    null
                                            ? state.userIdModel.employeeRecord
                                                .attendance.first.endTime!
                                            : '--',
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: 3,
                                  color:
                                      const Color.fromRGBO(199, 234, 215, 100),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                      ),
                                      _isCameraInitialized
                                          ? CameraWidget(
                                              controller: _cameraController)
                                          : const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      const SizedBox(height: 20),
                                      if (state.userIdModel.employeeRecord
                                                  .attendance ==
                                              null ||
                                          state.userIdModel.employeeRecord
                                                  .attendance !=
                                              null)
                                        Column(
                                          children: [
                                            if (state.userIdModel.employeeRecord
                                                .attendance.isEmpty)
                                              PunchInButton(
                                                  id: int.parse(widget.idd))
                                            else if (state
                                                    .userIdModel
                                                    .employeeRecord
                                                    .attendance
                                                    .isNotEmpty &&
                                                state.userIdModel.employeeRecord
                                                        .attendance.first.startTime !=
                                                    null &&
                                                state
                                                    .userIdModel
                                                    .employeeRecord
                                                    .attendance
                                                    .first
                                                    .startTime!
                                                    .isNotEmpty &&
                                                (state
                                                            .userIdModel
                                                            .employeeRecord
                                                            .attendance
                                                            .first
                                                            .endTime ==
                                                        null ||
                                                    state
                                                        .userIdModel
                                                        .employeeRecord
                                                        .attendance
                                                        .first
                                                        .endTime!
                                                        .isEmpty))
                                              Column(
                                                children: [
                                                  PunchOutButton(
                                                      id: int.parse(
                                                          widget.idd)),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  state
                                                              .userIdModel
                                                              .employeeRecord
                                                              .attendance
                                                              .isNotEmpty &&
                                                          state
                                                              .userIdModel
                                                              .employeeRecord
                                                              .attendance
                                                              .first
                                                              .breakTimes
                                                              .isNotEmpty
                                                      ? state
                                                                  .userIdModel
                                                                  .employeeRecord
                                                                  .attendance
                                                                  .first
                                                                  .breakTimes
                                                                  .where((breakTime) =>
                                                                      breakTime.startBreakTime !=
                                                                      null)
                                                                  .length >
                                                              state
                                                                  .userIdModel
                                                                  .employeeRecord
                                                                  .attendance
                                                                  .first
                                                                  .breakTimes
                                                                  .where((breakTime) =>
                                                                      breakTime.endBreakTime != null)
                                                                  .length
                                                          ? BreakEndButton(id: int.parse(widget.idd))
                                                          : BreakStartButton(id: int.parse(widget.idd))
                                                      : BreakStartButton(id: int.parse(widget.idd))
                                                ],
                                              )
                                            else if (state
                                                    .userIdModel
                                                    .employeeRecord
                                                    .attendance
                                                    .isNotEmpty &&
                                                state
                                                        .userIdModel
                                                        .employeeRecord
                                                        .attendance
                                                        .first
                                                        .endTime !=
                                                    null &&
                                                state
                                                    .userIdModel
                                                    .employeeRecord
                                                    .attendance
                                                    .first
                                                    .endTime!
                                                    .isNotEmpty)
                                              Container(),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.greenAccent,
                        ),
                      ),
          );
        }),
      ),
    );
  }
}
