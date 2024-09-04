import 'package:analog_clock/analog_clock.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeclock/views/login/UI/login.dart';
import 'package:timeclock/views/userpin/UI/widgets/confirmationdialog.dart';

class AnalogWatchWidget extends StatelessWidget {
  const AnalogWatchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.50,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(52, 60, 68, 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80.0),
              bottomRight: Radius.circular(80.0),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 9.5),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.2,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(77, 82, 86, 1),
                      shape: BoxShape.circle,
                    ),
                    child: AnalogClock(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3.0,
                          color: const Color.fromRGBO(52, 60, 68, 1),
                        ),
                        color: const Color.fromRGBO(52, 60, 68, 1),
                        shape: BoxShape.circle,
                      ),
                      width: 350.0,
                      isLive: true,
                      hourHandColor: const Color.fromRGBO(142, 152, 161, 1),
                      minuteHandColor: const Color.fromRGBO(142, 152, 161, 1),
                      secondHandColor: const Color.fromRGBO(70, 185, 122, 1),
                      showSecondHand: true,
                      numberColor: Colors.white,
                      showNumbers: false,
                      textScaleFactor: 1.5,
                      showTicks: true,
                      showDigitalClock: false,
                      digitalClockColor: Colors.white,
                      datetime: DateTime.now(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 30.80),
              AutoSizeText(
                DateFormat('hh:mm a').format(DateTime.now()),
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 60.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 70.80),
              AutoSizeText(
                '${DateFormat('EEEE, d MMM, yyyy').format(DateTime.now())} ',
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 99.80),
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 5,
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LogoutConfirmationDialog(
                    onConfirm: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.clear();
                      Get.offAll(() => const Login());
                    },
                  );
                },
              );
            },
            child: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
