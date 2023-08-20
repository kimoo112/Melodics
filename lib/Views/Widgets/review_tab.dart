import '../../Model/reviews_model.dart';
import 'review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Review (102)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            ListView.builder(
                itemCount: reviewsList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ReviewWidget(
                      reviewer: reviewsList[index].reviewer,
                      date: reviewsList[index].date,
                      starsRate: reviewsList[index].starsRate,
                      theReview: reviewsList[index].theReview);
                })
            // const ReviewWidget(
            //   date: 1,
            //   reviewer: 'Madelina',
            //   starsRate: 4.5,
            //   theReview:
            //       'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            // ),
            // const SizedBox(height: 20),
            // const Divider(
            //   indent: 20,
            //   endIndent: 30,
            //   color: cMain,
            // ),
            // SizedBox(height: 10.h),
            // const ReviewWidget(
            //   date: 3,
            //   reviewer: 'Irfan',
            //   starsRate: 4.0,
            //   theReview: 'Excepteur sint occaecat cupidatat non proident',
            // ),
            // const SizedBox(height: 20),
            // const Divider(
            //   indent: 20,
            //   endIndent: 30,
            //   color: cMain,
            // ),
            // SizedBox(height: 10.h),
            // const ReviewWidget(
            //   date: 4,
            //   reviewer: 'Ravi Putra',
            //   starsRate: 5.0,
            //   theReview:
            //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            // ),
          ],
        ),
      ),
    );
  }
}
