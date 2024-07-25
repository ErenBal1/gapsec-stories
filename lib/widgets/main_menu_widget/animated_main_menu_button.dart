import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gapsec/utils/app_font.dart';

class AnimatedMenuButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const AnimatedMenuButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  _AnimatedMenuButtonState createState() => _AnimatedMenuButtonState();
}

class _AnimatedMenuButtonState extends State<AnimatedMenuButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _isHovered
                  ? [const Color(0xFF2C3E50), const Color(0xFF34495E)]
                  : [const Color(0xFF34495E), const Color(0xFF2C3E50)],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.8),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  widget.text,
                  textStyle: AppFonts.mainMenuButton.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                  speed: const Duration(milliseconds: 80),
                ),
              ],
              totalRepeatCount: 1,
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
        ),
      ),
    );
  }
}
