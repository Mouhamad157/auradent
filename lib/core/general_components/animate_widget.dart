import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';

class AnimateWidget extends StatelessWidget {
  const AnimateWidget({
    super.key,
    required this.child,
    this.duration,
    this.offset,
    this.fade = true,
  });

  final Widget child;
  final Duration? duration;
  final Offset? offset;
  final bool fade;

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
        // fadeIn: fade,
        slidingBeginOffset: offset ?? const Offset(0, 0),
        slidingCurve: Curves.easeInOutCubicEmphasized,
        delay: duration ?? const Duration(milliseconds: 250),
        child: child);
  }

  factory AnimateWidget.withOffset({
    required Widget child,
    required double x,
    required double y,
    Duration? duration,
  }) {
    return AnimateWidget(
      duration: duration ?? const Duration(milliseconds: 250),
      offset: Offset(x, y),
      child: child,
    );
  }

  factory AnimateWidget.withXOffset({
    required Widget child,
    required double x,
    Duration? duration,
  }) {
    return AnimateWidget(
      duration: duration ?? const Duration(milliseconds: 250),
      offset: Offset(x, 0),
      child: child,
    );
  }

  factory AnimateWidget.withYOffset({
    required Widget child,
    required double y,
    Duration? duration,
  }) {
    return AnimateWidget(
      duration: duration ?? const Duration(milliseconds: 250),
      offset: Offset(0, y),
      child: child,
    );
  }
}
