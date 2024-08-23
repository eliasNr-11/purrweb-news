import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({super.parent});

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // Determine the current scroll position
    final pixels = position.pixels;

    // Determine the target index based on the current scroll position
    final targetIndex = ((pixels / 340).round()).h;

    // Calculate the target scroll position to snap the target index to the top
    final targetPixels = (targetIndex * 340.toDouble()).h;

    // Return a ScrollSpringSimulation to simulate the snapping behavior
    return ScrollSpringSimulation(spring, pixels, targetPixels, velocity,
        tolerance: tolerance);
    // return super.createBallisticSimulation(position, velocity);
  }
}