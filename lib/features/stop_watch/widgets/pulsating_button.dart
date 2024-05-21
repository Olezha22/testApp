import 'package:flutter/material.dart';

class PulsatingButton extends StatefulWidget {
  final bool started;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  const PulsatingButton({
    super.key,
    required this.started,
    required this.onPlay,
    required this.onPause,
  });

  @override
  PulsatingButtonState createState() => PulsatingButtonState();
}

class PulsatingButtonState extends State<PulsatingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(PulsatingButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.started) {
      _animationController.stop();
      _animationController.reset();
    } else {
      _animationController.repeat(reverse: true);
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
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.blue[100],
            ),
            onPressed: () {
              if (widget.started) {
                widget.onPause();
              } else {
                widget.onPlay();
              }
            },
            child: Icon(
              widget.started ? Icons.pause : Icons.play_arrow,
              color: Colors.black,
              size: 35,
            ),
          ),
        );
      },
    );
  }
}