import 'package:flutter/material.dart';

class FavouriteIconButton extends StatelessWidget {
  final bool filled;
  const FavouriteIconButton({required this.filled, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.favorite_border,
        size: 28,
      ),
    );
  }
}
