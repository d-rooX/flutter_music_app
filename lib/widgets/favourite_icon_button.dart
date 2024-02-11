import 'package:flutter/material.dart';

class FavouriteIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool filled;
  const FavouriteIconButton({
    required this.onPressed,
    required this.filled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        filled ? Icons.favorite : Icons.favorite_border,
        size: 28,
      ),
    );
  }
}
