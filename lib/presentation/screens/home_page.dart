import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pureweb_news/data/models/news_card_model.dart';
import 'package:pureweb_news/presentation/constants/constants.dart';
import 'package:pureweb_news/presentation/widgets/custom_scroll_physics.dart';
import 'package:pureweb_news/presentation/widgets/home_menus.dart';
import 'package:pureweb_news/presentation/widgets/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController();

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<Color?> _fontColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _colorAnimation = ColorTween(
      begin: Constants.kcCard,
      end: Constants.kcCard,
    ).animate(_controller);

    _fontColorAnimation = ColorTween(
      begin: Constants.kcTextTwo,
      end: Constants.kcTextTwo,
    ).animate(_controller);

    // Listen to animation status
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation completed, update currentIndex after animation
        setState(() {
          // Update currentIndex
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Constants.kcBkg,
          ),
        ),
        Positioned(
          top: 80.r,
          left: MediaQuery.of(context).size.width / 2.5,
          child: Container(
            height: 180.r,
            width: 160.r,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Constants.kcBkgBlurOne,
                blurRadius: 100.r,
                spreadRadius: 60.r,
              )
            ]),
          ),
        ),
        Positioned(
          bottom: (-MediaQuery.of(context).size.width + 80).r,
          left: -MediaQuery.of(context).size.width.r,
          child: Container(
            height: 280.r,
            width: (MediaQuery.of(context).size.width * 2).r,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Constants.kcBkgBlurTwo,
                blurRadius: 120.r,
                spreadRadius: 200,
              )
            ]),
          ),
        ),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              toolbarHeight: 70.h,
              leading: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      width: 94.r,
                      height: 52.r,
                    ),
                    Positioned(
                      left: 62.r,
                      child: Container(
                        height: 52.r,
                        width: 52.r,
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, size: 32.sp),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        height: 52.r,
                        width: 52.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/user.jpeg'),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  clipBehavior: Clip.antiAlias,
                  height: 52.r,
                  width: 52.r,
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 2.r,
                            top: 2.r,
                            bottom: 2.r,
                            right: 5.r,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Icon(
                            Icons.show_chart,
                            size: 16.sp,
                            color: Constants.kcBkg,
                          ),
                        ),
                        Positioned(
                          top: -3.r,
                          right: -3.r,
                          child: Container(
                            width: 10.r,
                            height: 10.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  width: 2.w, color: Constants.kcBkgBlurOne),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'News',
                        style: TextStyle(
                            fontSize: 84.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -6),
                      ),
                      Image.asset(
                        Constants.search,
                        height: 30.r,
                        width: 30.r,
                        color: Constants.kcTextOne,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        const HomeMenus(
                          isBookmark: true,
                          isSelected: false,
                        ),
                        SizedBox(width: 10.w),
                        const HomeMenus(
                          isBookmark: false,
                          isSelected: true,
                          name: 'My Feed',
                        ),
                        SizedBox(width: 10.w),
                        const HomeMenus(
                          isBookmark: false,
                          isSelected: false,
                          name: 'Latest news',
                        ),
                        SizedBox(width: 10.w),
                        const HomeMenus(
                          isBookmark: false,
                          isSelected: false,
                          name: 'Bitcoin news',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollUpdateNotification) {
                        final newIndex =
                            (notification.metrics.pixels / 400).round();
                        if (newIndex != currentIndex) {
                          currentIndex = newIndex;
                          _controller.reset(); // Reset animation
                          _controller.forward(); // Start animation
                        }
                      }
                      return false;
                    },
                    child: ListView.builder(
                      physics:
                          const SnapToItemScrollPhysics(), // Custom scroll physics
                      itemCount: newsList.length,
                      itemBuilder: (context, index) {
                        final currentColor = index == currentIndex
                            ? _colorAnimation.value
                            : Colors.white12;
                        final currentFontColor = index == currentIndex
                            ? _fontColorAnimation.value
                            : Constants.kcTextOne;
                        return NewsCard(
                          currentColor: currentColor,
                          currentFontColor: currentFontColor,
                          data: newsList[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
