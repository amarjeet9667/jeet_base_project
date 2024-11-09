import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReusableRatingBar extends StatelessWidget {
  final double rating;
  final double size;
  final int count;
  final bool ignoreRate;
  final void Function(double) onRatingUpdate;

  const ReusableRatingBar({
    super.key,
    required this.rating,
    this.count = 5,
    required this.size,
    this.ignoreRate = true,
    required this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      itemSize: size,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: false,
      glowRadius: 0,
      itemCount: count,
      unratedColor: const Color(0xffE5E5E5),
      itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
