import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  static const String name = 'animated_screen';

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;

  void changeShape() {
    width = Random().nextInt(300) + 120.0;
    height = Random().nextInt(300) + 120.0;
    borderRadius = Random().nextInt(100) + 20.0;
    color = Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            width: width <= 0 ? 0 : width,
            height: height <= 0 ? 0 : height,
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
            )),
      ),
    );
  }
}
