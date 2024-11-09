import 'package:flutter/material.dart';

class ReusableLoadingWithText extends StatelessWidget {
  final String message;

  const ReusableLoadingWithText({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 6 ),
          CircularProgressIndicator(
            strokeWidth: 3,
          ),
          SizedBox(height: 12 ),

        ],
      ),
    );
  }
}
