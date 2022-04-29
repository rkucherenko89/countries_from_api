import 'package:countries_from_api/models/country.dart';
import 'package:countries_from_api/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final Country country;

  const CountryCard({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            buildBackground(),
            buildCountryCard(context),
          ],
        ),
      ),
    );
  }

  Container buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(AppTheme.paperBackgroundUrl),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget buildCountryCard(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5 -
                      20, // ! ширина устройства * 0.5(половина) - 20(это ширина паддинга с одной стороны)
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(country.flagUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(country.name),
                    Text(country.fullName),
                  ],
                ),
              ],
            ),
            Text('Capital: ${country.capital}'),
            Text('Domain: ${country.domain}'),
            Text('Population: ${country.population}'),
            Text('Area: ${country.area}'),
            Text('Languages: ${country.languages}'),
            Text('Currencies: ${country.currencies}'),
            Text('Timezones: ${country.timezones}'),
            Text('Continents: ${country.continents}'),
            Text('Borders: ${country.borders}'),
          ],
        ),
      );
}
