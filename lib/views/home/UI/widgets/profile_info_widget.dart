import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeclock/views/userpin/Model/UserIdModel.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({
    super.key,
    required this.employeeRecord,
  });

  final EmployeeRecord employeeRecord;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          // width: MediaQuery.of(context).size.width *
          //     0.11,
          child: CircleAvatar(
            radius: 40, // Image radius
            backgroundImage: NetworkImage(employeeRecord.orgLogo??''),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // '',
                employeeRecord.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Color.fromRGBO(52, 60, 68, 1),
                ),
              ),
              SizedBox(
                width: context.width / 7,
                child: const AutoSizeText(
                  'Senior UI/UX Designer',
                  // widget.userData.employeeRecord.
                  maxLines: 4,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(52, 60, 68, 1),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
