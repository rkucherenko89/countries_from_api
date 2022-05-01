import 'package:flutter/material.dart';

abstract class AppTheme {
  static const String paperBackgroundUrl =
      'https://wallpaperaccess.com/full/2413177.jpg';

  static Widget buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(AppTheme.paperBackgroundUrl),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
