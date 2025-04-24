import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const RoundIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = Colors.blue,
    this.iconColor = Colors.white,
    this.size = 56,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: RawMaterialButton(
        shape: const CircleBorder(),
        fillColor: backgroundColor,
        elevation: 4,
        onPressed: onPressed,
        child: Icon(icon, color: iconColor, size: size * 0.5),
      ),
    );
  }
}
