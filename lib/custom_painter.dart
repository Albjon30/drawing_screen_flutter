import 'package:flutter/material.dart';

/// This AwesomePainter class grants access to a Canvas object, your playground, for
/// custom drawing. The paint method is where all the magic happens. Here, you
/// can draw anything from simple shapes to complex graphics on the canvas using
/// various drawing methods provided by the Canvas API. The size parameter gives
/// you the dimensions of the area you have for drawing.

class AwesomePainter extends CustomPainter {
  const AwesomePainter();

  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) =>
      false;
}

/// DrawingPainter extends CustomPainter and is responsible for rendering the
/// drawing on the canvas. The Constructor takes a list of Offset points, repre-
/// senting the positions where the user has touched the screen.

class DrawingPainter extends CustomPainter {
  List<Offset> points;

  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round;
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(
        points[i],
        points[i + 1],
        pencil,
      );
    }
  }

  @override
  bool shouldRepaint(
    DrawingPainter oldDelegate,
  ) =>
      true;

  @override
  bool shouldRebuildSemantics(
    DrawingPainter oldDelegate,
  ) =>
      false;

  @override
  bool? hitTest(Offset position) {
    return super.hitTest(position);
  }
}
