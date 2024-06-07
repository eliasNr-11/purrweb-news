import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:purrweb_news/presentation/constants/constants.dart';

class HomeMenus extends StatelessWidget {
  const HomeMenus({
    super.key,
    required this.isBookmark,
    this.name,
    required this.isSelected,
  });

  final bool isBookmark;
  final String? name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.w),
          color: isSelected ? Constants.kcSecondary : Colors.white12),
      child: isBookmark
          // ? Icon(
          //     Icons.bookmark_rounded,
          //     size: 28.sp,
          //     color: isSelected ? Constants.kcTextTwo : Constants.kcTextOne,
          //   )
          ? Image.asset('assets/images/bookmark.png', width: 28.r, color: Constants.kcTextOne,)
          : Center(
              child: Text(
                name!,
                style: TextStyle(
                  color: isSelected ? Constants.kcTextTwo : Constants.kcTextOne,
                  fontSize: 20.sp,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
    );
  }
}
