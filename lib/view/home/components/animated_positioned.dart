import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';

class MultipleCurvedMovingBubbles extends StatefulWidget {
  @override
  _MultipleCurvedMovingBubblesState createState() =>
      _MultipleCurvedMovingBubblesState();
}

class _MultipleCurvedMovingBubblesState
    extends State<MultipleCurvedMovingBubbles> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late Animation<double> _animation1;

  late AnimationController _controller2;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation1 = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller1)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller1.forward();
        }
      });

    _controller1.forward();

    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation2 = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(_controller2)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller2.forward();
        }
      });

    _controller2.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
 
          buildAnimatedBubble(_animation1),
          buildAnimatedBubble(_animation2),
        ],
      ),
    );
  }

  Widget buildAnimatedBubble(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: CurvedBubblesPainter(animation.value),
          child: Container(),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
}

class CurvedBubblesPainter extends CustomPainter {
  final double animationValue;

  CurvedBubblesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = secondColor
      ..style = PaintingStyle.fill;

    double curveHeight = Get.height / 2;
    double curveWidth = Get.width / 3;

    double centerX = Get.width;
    double centerY = Get.height;

    double x = centerX + sin(animationValue * 2 * pi) * curveWidth;
    double y = centerY + cos(animationValue * 2 * pi) * curveHeight;

    canvas.drawCircle(
      Offset(x, y),
      30,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
