import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PunchOutTimeWidget extends StatelessWidget {
  const PunchOutTimeWidget({
    super.key,
    required this.offtime,
  });

  final String? offtime;

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
              'CHECK-OUT TIME',
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
            child: AutoSizeText(
              offtime ?? '--',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Color.fromRGBO(70, 185, 155, 1),
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 4),
        Container(
          height: 40,
          color: const Color.fromRGBO(52, 60, 68, 1),
          child: const Row(
            children: [
              Expanded(
                child: Center(
                  child: AutoSizeText(
                    'POWERED BY THE STAFFER',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
