import 'package:flutter/material.dart';
import '../utils.dart';

class ReusableTextTile extends StatelessWidget {
  final String heading;
  final String subText;
  final double headingWidth;

  const ReusableTextTile({
    super.key,
    required this.heading,
    required this.subText,  this.headingWidth = 110,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: headingWidth,
          child: Text(
            heading,
            style: const TextStyle(
                color: ColorsUtils.defaultThemeColor,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ),
        Expanded(
          child: Text(
            subText,
            style: const TextStyle(
              color: Color(0xff79747E),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
