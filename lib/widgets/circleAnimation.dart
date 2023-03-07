import 'package:flutter/widgets.dart';

class CircleAnimaion extends StatefulWidget {
  final Widget child;
  CircleAnimaion({super.key, required this.child});

  @override
  State<CircleAnimaion> createState() => _CircleAnimaionState();
}

class _CircleAnimaionState extends State<CircleAnimaion>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(controller),
      child: widget.child,
    );
  }
}
