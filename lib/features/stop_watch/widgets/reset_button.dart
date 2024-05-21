import 'package:flutter/material.dart';
import 'package:test_app/generated/l10n.dart';

class ResetButton extends StatelessWidget {
  final bool visible;
  final VoidCallback onReset;
  const ResetButton({super.key, required this.visible, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: visible ? Colors.blue[200] : Colors.transparent,
        ),
        onPressed: onReset,
        child: Text(
          S.of(context).reset,
          style: TextStyle(
            fontSize: 18,
            color: visible ? Colors.black : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
