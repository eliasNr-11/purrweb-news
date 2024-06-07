import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:purrweb_news/data/models/news_card_model.dart';
import 'package:purrweb_news/presentation/constants/constants.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.currentColor,
    required this.currentFontColor,
    required this.data,
  });

  final Color? currentColor;
  final Color? currentFontColor;
  final NewsCardModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: currentColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Text(
            data.title,
            style: TextStyle(
              fontSize: 24.sp,
              color: currentFontColor,
              fontWeight: FontWeight.w600,
              letterSpacing: -1.6.r,
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            data.bodyText,
            style: TextStyle(
              fontSize: 18.sp,
              color: currentFontColor!.withOpacity(0.7),
              fontWeight: FontWeight.w300,
              letterSpacing: -1.r,
            ),
          ),
          SizedBox(height: 36.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.author,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: currentFontColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -1.r,
                ),
              ),
              Text(
                data.date,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: currentFontColor,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1.r,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Divider(
            height: 36.h,
            thickness: 0.2.sp,
            color: currentFontColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.visibility,
                    color: currentFontColor!.withOpacity(0.7),
                    size: 16.sp,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    data.viewCount,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: currentFontColor!.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 46.h,
                    padding: EdgeInsets.all(12.r),
                    decoration: const BoxDecoration(
                      color: Constants.kcSecondary,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(Constants.share),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    height: 46.h,
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                        color: Constants.kcSecondary,
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Row(
                      children: [
                        Image.asset(Constants.comment),
                        SizedBox(width: 5.w),
                        Text(
                          data.messageCount,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Constants.kcTextTwo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    height: 46.h,
                    padding: EdgeInsets.all(12.r),
                    decoration: const BoxDecoration(
                      color: Constants.kcSecondary,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(Constants.like),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}