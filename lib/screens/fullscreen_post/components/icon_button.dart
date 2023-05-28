import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.iconData,
    required this.subtitle,
    required this.onPressed,this.color = Colors.white,
  });

  final IconData iconData;
  final String subtitle;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              size: 30,
              color: color,
            ),
          ),
          Text(subtitle)
        ],
      ),
    );
  }
}