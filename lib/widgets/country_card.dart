import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final String flag;
  
  const CountryCard({
    Key? key,
    required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(flag),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
