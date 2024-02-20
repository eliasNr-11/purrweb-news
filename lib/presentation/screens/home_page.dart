import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pureweb_news/presentation/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // final PageController _pageController = PageController(viewportFraction: 1);
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
                        'assets/images/search.png',
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
                        Container(
                          height: 46.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.w),
                              color: Colors.white12),
                          child: Icon(
                            Icons.bookmark_rounded,
                            size: 28.sp,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 46.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.w),
                              color: Constants.kcSecondary),
                          child: Center(
                            child: Text(
                              'My Feed',
                              style: TextStyle(
                                color: Constants.kcTextTwo,
                                fontSize: 20.sp,
                                letterSpacing: -1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 46.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.w),
                            color: Colors.white12,
                          ),
                          child: Center(
                            child: Text(
                              'Latest news',
                              style: TextStyle(
                                fontSize: 20.sp,
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 46.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.w),
                            color: Colors.white12,
                          ),
                          child: Center(
                            child: Text(
                              'Bitcoin news',
                              style: TextStyle(
                                fontSize: 20.sp,
                                letterSpacing: -1,
                              ),
                            ),
                          ),
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
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final currentColor = index == currentIndex
                            ? _colorAnimation.value
                            : Colors.white24;
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

class NewsCardData {
  const NewsCardData({
    required this.title,
    required this.bodyText,
    required this.author,
    required this.date,
    required this.viewCount,
    required this.messageCount,
  });

  final String title;
  final String bodyText;
  final String author;
  final String date;
  final String viewCount;
  final String messageCount;
}

final List<NewsCardData> newsList = [
  const NewsCardData(
    title: "BTC's Hash Rate Up More Than 600% In Two Years: CryptoQuant CEO",
    bodyText: "The insights platform Kaiko warned that the market may enter into a period...",
    author: "Steven Walgenbach",
    date: "July 19, 2023",
    viewCount: "780",
    messageCount: "12",
  ),
  const NewsCardData(
    title: "Bitcoin Reigns, Dominates 99% of Inflows in Cryptocurrency Investments",
    bodyText: "Bitcoin's dominance: captures 99% of inflows in cryptocurrency..",
    author: "Vignesh Karunanidhi",
    date: "July 19,2023",
    viewCount: "640",
    messageCount: "17",
  ),
  const NewsCardData(
    title: "BTC's Hash Rate Up More Than 600% In Two Years: CryptoQuant CEO",
    bodyText: "The insights platform Kaiko warned that the market may enter into a period...",
    author: "Steven Walgenbach",
    date: "July 19, 2023",
    viewCount: "780",
    messageCount: "12",
  ),
];

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.currentColor,
    required this.currentFontColor,
    required this.data,
  });

  final Color? currentColor;
  final Color? currentFontColor;
  final NewsCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        // color: Constants.kcCard,
        color: currentColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Text(
            "BTC's Hash Rate Up More Than 600% In Two Years: CryptoQuant CEO",
            style: TextStyle(
              fontSize: 24.sp,
              color: currentFontColor,
              fontWeight: FontWeight.w600,
              letterSpacing: -2,
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            "The insights platform Kaiko warned that the market may enter into a period...",
            style: TextStyle(
              fontSize: 18.sp,
              color: currentFontColor!.withOpacity(0.7),
              fontWeight: FontWeight.w300,
              letterSpacing: -1,
            ),
          ),
          SizedBox(height: 36.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Steven Walgenbach",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: currentFontColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -1,
                ),
              ),
              Text(
                "July 19, 2023",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: currentFontColor,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1,
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
                    "780",
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
                    child: Image.asset('assets/images/share.png'),
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
                        Image.asset('assets/images/comment.png'),
                        SizedBox(width: 5.w),
                        Text(
                          "12",
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
                    child: Image.asset('assets/images/like.png'),
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

class SnapToItemScrollPhysics extends ScrollPhysics {
  const SnapToItemScrollPhysics({ScrollPhysics? parent})
      : super(parent: parent);

  @override
  SnapToItemScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SnapToItemScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // Determine the current scroll position
    final pixels = position.pixels;

    // Determine the target index based on the current scroll position
    final targetIndex = (pixels / 340).round();

    // Calculate the target scroll position to snap the target index to the top
    final targetPixels = targetIndex * 340.toDouble();

    // Return a ScrollSpringSimulation to simulate the snapping behavior
    return ScrollSpringSimulation(spring, pixels, targetPixels, velocity,
        tolerance: tolerance);
    // return super.createBallisticSimulation(position, velocity);
  }
}
