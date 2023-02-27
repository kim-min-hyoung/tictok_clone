import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class InfoText extends StatelessWidget {
  final String infoNum;
  final String infoSubText;

  const InfoText({
    Key? key,
    required this.infoNum,
    required this.infoSubText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          infoNum,
          style: const TextStyle(
            fontSize: Sizes.size18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v3,
        Text(
          infoSubText,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
