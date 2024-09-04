import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date_containerWidget extends StatelessWidget {
  const Date_containerWidget({
    super.key,
    required this.now,
    required this.formattedDate,
  });

  final DateTime now;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(199, 234, 215, 100),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 14, 0, 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      // '02:31 PM',
                      DateFormat.Hm().format(now),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color.fromRGBO(52, 60, 68, 1),
                      ),
                    ),
                    AutoSizeText(
                      // 'Wednesday, February 15, 2023',
                      formattedDate,
                      style: const TextStyle(
                        //    fontWeight: FontWeight.w400,
                        fontSize: 8,
                        color: Color.fromRGBO(52, 60, 68, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.cloud,
                  size: 30,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
