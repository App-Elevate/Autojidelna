import 'package:flutter/material.dart';

/// Used to create a border with a missing bottom line around an object
class CustomBottomSheetShape extends ShapeBorder {
  final BorderSide side;
  final BorderRadius borderRadius;

  const CustomBottomSheetShape({this.side = BorderSide.none, this.borderRadius = BorderRadius.zero});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) {
    return CustomBottomSheetShape(
      side: side.scale(t),
      borderRadius: borderRadius * t,
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // Create a path with only the top corners rounded
    return Path()
      ..moveTo(rect.left, rect.top + borderRadius.topLeft.y)
      ..arcToPoint(
        Offset(rect.left + borderRadius.topLeft.x, rect.top),
        radius: Radius.circular(borderRadius.topLeft.x),
      )
      ..lineTo(rect.right - borderRadius.topRight.x, rect.top)
      ..arcToPoint(
        Offset(rect.right, rect.top + borderRadius.topRight.y),
        radius: Radius.circular(borderRadius.topRight.y),
      )
      ..lineTo(rect.right, rect.bottom) // Right border
      ..lineTo(rect.left, rect.bottom) // Skip bottom border
      ..close(); // Connect back to the start
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final Paint paint = Paint()
      ..color = side.color // Border color
      ..strokeWidth = side.width * 2
      ..style = PaintingStyle.stroke;

    // Draw only the top and side borders
    final Path path = Path()
      ..moveTo(rect.left, rect.bottom) // Jump to bottom
      ..lineTo(rect.left, rect.top + borderRadius.topLeft.y) // Left border
      ..arcToPoint(
        Offset(rect.left + borderRadius.topLeft.x, rect.top),
        radius: Radius.circular(borderRadius.topLeft.x),
      )
      ..lineTo(rect.right - borderRadius.topRight.x, rect.top) // Top border
      ..arcToPoint(
        Offset(rect.right, rect.top + borderRadius.topRight.y),
        radius: Radius.circular(borderRadius.topRight.y),
      )
      ..lineTo(rect.right, rect.bottom); // Right border

    canvas.drawPath(path, paint);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // Inner path for clipping (if needed)
    return Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          rect,
          topLeft: borderRadius.topLeft,
          topRight: borderRadius.topRight,
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      );
  }
}
