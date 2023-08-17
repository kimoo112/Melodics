import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/Constants/assets.dart';
import '../../Helpers/Constants/colors.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 220.h,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: cWhite),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      "TMA-2\nModular\nHeadphone",
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Shop now",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w800,
                                color: cMain)),
                        const SizedBox(width: 20),
                        const Icon(CupertinoIcons.arrow_right_circle,
                            color: cMain),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                  width: 150.w,
                  child: Image.asset(
                    Assets.imagesHeadPhone1,
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
