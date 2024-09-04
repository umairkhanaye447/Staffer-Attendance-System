import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeclock/views/userpin/Model/UserIdModel.dart';

class EndTimeWidget extends StatelessWidget {
  const EndTimeWidget({
    super.key,
    required this.breakEndList,
  });

  final List<BreakTime> breakEndList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Text(
          'End Time',
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontSize: 10.0,
            color: Color.fromRGBO(112, 112, 112, 1),
          ),
        ),
        const SizedBox(height: 5),
        if (breakEndList.isNotEmpty)
          for (int i = 0; i < breakEndList.length; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Text(
                breakEndList[i] != null
                    ? DateFormat('hh:mm:ss').parse(breakEndList[i].endTime!).toString()
                    : '---',
                style: const TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
        if (breakEndList.isEmpty)
          const Text(
            '0:00:00',
            style: TextStyle(
              fontFamily: 'Nunito Sans',
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
      ],
    );
  }
}
