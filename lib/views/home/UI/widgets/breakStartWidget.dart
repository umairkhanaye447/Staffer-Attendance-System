import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeclock/views/userpin/Model/UserIdModel.dart';

class BreakWidget extends StatelessWidget {
  const BreakWidget({
    super.key,
    required this.breakList,
  });

  final List<BreakTime?> breakList;

  DateTime convertHHMMSStoDatetime(String hhmmss) {
    DateTime time = DateFormat("HH:mm:ss").parse(hhmmss);
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (breakList.isNotEmpty)
          ...List.generate(
            breakList.length,
            (i) => breakList[i] != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        breakList[i]!.startTime,
                        style: const TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      const Text("   -----   "),
                      Text(
                        breakList[i]!.endTime,
                        style: const TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Color.fromRGBO(255, 139, 45, 1),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        if (breakList.isEmpty)
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '00:00',
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              Text("    -----   "),
              Text(
                '00:00',
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Color.fromRGBO(255, 139, 45, 1),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
