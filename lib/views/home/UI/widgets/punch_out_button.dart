import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeclock/views/home/bloc/check_in_chck_out_bloc.dart';
import 'package:timeclock/views/userpin/UI/userpin.dart';

class PunchOutButton extends StatefulWidget {
  const PunchOutButton({super.key, required this.id});
  final int id;

  @override
  State<PunchOutButton> createState() => _PunchOutButtonState();
}

class _PunchOutButtonState extends State<PunchOutButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.40,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(255, 139, 45, 1),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () async {
          final now = DateTime.now();
          final checkOutTime = DateFormat('HH:mm:ss').format(now);
          final employeeId = widget.id;
          // Trigger the event to send the check-out time
          if (employeeId != null) {
            context.read<AttendanceBloc>().add(
                  SendCheckOutEvent(
                    checkOutTime: checkOutTime,
                    employeeId: employeeId,
                  ),
                );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Punched-Out')),
            );

            // Wait for a few seconds (e.g., 2 seconds) before navigating back
            await Future.delayed(const Duration(seconds: 2));

            if (mounted && Navigator.canPop(context)) {}
          }

          // Navigator.pop(context);
          Get.to(UserpinScreen());
        },
        child: const Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'PUNCH - OUT',
                style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'The work may be done, but the results last forever.',
                style: TextStyle(
                  fontSize: 13.0,
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
