import 'package:flutter/material.dart';

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