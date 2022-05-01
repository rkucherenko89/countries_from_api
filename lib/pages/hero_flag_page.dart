import 'package:countries_from_api/models/country.dart';
import 'package:countries_from_api/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HeroFlagPage extends StatelessWidget {
  final Country country;
  const HeroFlagPage({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            AppTheme.buildBackground(),
            Hero(
              tag: country.name,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(country.flagUrl),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
