import 'package:countries_from_api/models/country.dart';
import 'package:countries_from_api/pages/countries_by_currencies.dart';
import 'package:countries_from_api/pages/countries_by_language_page.dart';
import 'package:countries_from_api/pages/countries_by_region.dart';
import 'package:countries_from_api/pages/countries_by_subregion.dart';
import 'package:countries_from_api/pages/hero_flag_page.dart';
import 'package:countries_from_api/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryCard extends StatefulWidget {
  final Country country;

  const CountryCard({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  State<CountryCard> createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
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

  Widget buildCountryCard(BuildContext context) {
    final TextStyle textStyle = GoogleFonts.akayaTelivigala(
        textStyle: const TextStyle(fontSize: 24, color: Colors.black));

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        HeroFlagPage(country: widget.country))),
                child: Hero(
                  tag: widget.country.name,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5 -
                        20, // ! ширина устройства * 0.5(половина) - 20(это ширина паддинга с одной стороны)
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topLeft,
                        image: NetworkImage(widget.country.flagUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5 - 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.country.name,
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(fontSize: 28),
                      ),
                      Text(
                        widget.country.fullName,
                        maxLines: 5,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Capital: ${widget.country.capital}', style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Domain: ${widget.country.domain}', style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Population: ${widget.country.population}',
                style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
                'Area: ${widget.country.area} km${String.fromCharCode(0x00B2)}',
                style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                style: textStyle,
                children: [
                  const TextSpan(text: 'Languages: '),
                  for (int i = 0; i < widget.country.languages.length; i++)
                    TextSpan(
                      text: i == widget.country.languages.length - 1
                          ? '${widget.country.languages[i]}'
                          : '${widget.country.languages[i]}, ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => openCountriesByLanguage(
                            widget.country.languages[i]),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                style: textStyle,
                children: [
                  TextSpan(
                    text: 'Currencies: ${widget.country.currencies}',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          openCoutriesByCurrencies(widget.country.currencies),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Timezones: ${widget.country.timezones}',
                style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                style: textStyle,
                children: [
                  TextSpan(
                    text: 'Location: ${widget.country.region}',
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => openCoutriesByRegion(widget.country.region),
                  ),
                  const TextSpan(text: ' - '),
                  TextSpan(
                    text: widget.country.subregion,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          openCoutriesBySubregion(widget.country.subregion),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Borders: ${widget.country.borders}', style: textStyle),
          ),
        ],
      ),
    );
  }

  void openCountriesByLanguage(String query) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CountriesByLanguage(query: query),
      ),
    );
  }

  void openCoutriesByCurrencies(String query) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CountriesByCurrencies(query: query),
      ),
    );
  }

  void openCoutriesByRegion(String query) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CountriesByRegion(query: query),
      ),
    );
  }

  void openCoutriesBySubregion(String query) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CountriesBySubregion(query: query),
      ),
    );
  }
}
