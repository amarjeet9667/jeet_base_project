import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final int color;
  final double height;
  final double width;
  final double radius;
  final double fontsize;
  final double elevation;
  final void Function()? ontap;
  final int borderColor;

  const ReusableButton({
    Key? key,
    required this.title,
    this.color = 0xffF78C26,
    this.fontsize = 20,
    required this.ontap,
    this.height = 56,
    this.width = double.infinity,
    this.radius = 100,
    this.borderColor = 0xffF78C26,  this.elevation = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: Color(borderColor), width: 1)),
          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: fontsize,
                      color: color == 0xffffffff ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w700,
                    letterSpacing: .5
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
