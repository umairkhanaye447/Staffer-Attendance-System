import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeclock/views/home/bloc/check_in_chck_out_bloc.dart';
import 'package:timeclock/views/userpin/UI/userpin.dart';

class BreakStartButton extends StatefulWidget {
  const BreakStartButton({super.key, required this.id});
  final int id;

  @override
  State<BreakStartButton> createState() => _BreakStartButtonState();
}

class _BreakStartButtonState extends State<BreakStartButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            const Color.fromRGBO(70, 185, 122, 1),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () async {
          final now = DateTime.now();
          final breakstart = DateFormat('HH:mm:ss').format(now);
          final employeeId = widget.id;
          // Trigger the event to send the check-out time
          if (employeeId != null) {
            context.read<AttendanceBloc>().add(
                  SendBreakStartEvent(
                    breakStartTime: breakstart,
                    employeeId: employeeId,
                  ),
                );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Break Started')),
            );
            // Wait for a few seconds (e.g., 2 seconds) before navigating back
            await Future.delayed(const Duration(seconds: 2));

            if (mounted) {
              Navigator.pop(context);
            }
          }

          // Navigator.pop(context);
          // Get.to(UserpinScreen());
        },
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'imagesvg/cup.svg',
              ),
              const SizedBox(width: 10),
              const Text(
                'START BREAK',
                //   'Login',
                style: TextStyle(
                  //      fontWeight: FontWeight.bold,
                  fontSize: 36.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
