import 'package:flutter/material.dart';

class StopWatchText extends StatefulWidget {
  final String digitHours, digitMinutes, digitSeconds;
  final bool started;
  const StopWatchText({
    super.key,
    required this.digitHours,
    required this.digitMinutes,
    required this.digitSeconds,
    required this.started,
  });

  @override
  State<StopWatchText> createState() => _StopWatchTextState();
}

class _StopWatchTextState extends State<StopWatchText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(StopWatchText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.started) {
      _animationController.repeat(reverse: true);
    } else {
      _animationController.stop();
      _animationController.reset();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Text(
            "${widget.digitHours}:${widget.digitMinutes}:${widget.digitSeconds}",
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
