import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PunchInTimeNoted extends StatelessWidget {
  const PunchInTimeNoted({
    super.key,
    required this.starttime,
  });

  final String? starttime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Container(
            alignment: Alignment.centerLeft,
            child: const AutoSizeText(
              'CHECK-IN TIME',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color.fromRGBO(52, 60, 68, 1),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Container(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(starttime ?? '--',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Color.fromRGBO(70, 185, 155, 1),
                  ),
                ),
              ),
            ),
       
      ],
    );
  }
}
