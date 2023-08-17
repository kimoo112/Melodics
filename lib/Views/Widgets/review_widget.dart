import 'package:audio/Views/Widgets/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Helpers/Constants/colors.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.reviewer,
    required this.date,
    required this.starsRate,
    required this.theReview,
  });
  final String reviewer;
  final String theReview;
  final int date;
  final double starsRate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(reviewer),
            Text(
              '$date Month ago',
              style: TextStyle(color: cMain.withOpacity(.7), fontSize: 12),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        StarsRating(
          starsValue: starsRate,
        ),
        SizedBox(height: 10.h),
        Text(theReview),
        SizedBox(height: 20.h),
        const Divider(
          indent: 20,
          endIndent: 30,
          color: cMain,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
