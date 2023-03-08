import 'package:flutter/material.dart';

class CameraIconButton extends StatelessWidget {
  final IconData icon;
  final bool isSelect;
  final void Function()? onPressed;

  const CameraIconButton({
    super.key,
    this.isSelect = false,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      color: isSelect ? Colors.amber.shade200 : Colors.white,
    );
  }
}
