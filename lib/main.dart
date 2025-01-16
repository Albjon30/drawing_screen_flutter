import 'package:flutter/material.dart';
import 'package:mo_music/custom_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Drawing',
      home: DrawingPage(),
    );
  }
}

class DrawingPage extends StatefulWidget {
  const DrawingPage({super.key});
  @override
  DrawingPageState createState() => DrawingPageState();
}

class DrawingPageState extends State<DrawingPage> {
  List<Offset> points = <Offset>[];
  final pointsListenable = ValueNotifier<List<Offset>>([]);
  @override
  Widget build(BuildContext context) {
    // 38 Custom Painters and Shaders
    return Scaffold(
      appBar: AppBar(
        title: const Text('DrawingPage'),
      ),
      body: GestureDetector(
        onPanStart: (details) => points.add(details.localPosition),
        onPanUpdate: (
          DragUpdateDetails details,
        ) {
          points.add(details.localPosition);
          setState(() {});
        },
        onPanEnd: (DragEndDetails details) {
          points.add(Offset.infinite);
        },
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: DrawingPainter(points),
            child: Container(),
          ),
        ),
      ),
    );
  }
}
