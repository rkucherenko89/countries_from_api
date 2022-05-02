import 'package:countries_from_api/api/countries_api.dart';
import 'package:countries_from_api/models/country.dart';
import 'package:countries_from_api/theme/app_theme.dart';
import 'package:countries_from_api/widgets/country_card.dart';
import 'package:flutter/material.dart';

class CountriesByRegion extends StatefulWidget {
  final String query;
  const CountriesByRegion({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  State<CountriesByRegion> createState() => _CountriesByRegionState();
}

class _CountriesByRegionState extends State<CountriesByRegion> {
  List countries = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final countries = await CountriesApi.getCoutriesByRegion(widget.query);
    setState(() {
      this.countries = countries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            AppTheme.buildBackground(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  buildHeader(),
                  const SizedBox(height: 10),
                  buildListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildHeader() {
    const TextStyle style = TextStyle(fontSize: 28);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Countries in ${widget.query} region',
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: countries.length,
        itemBuilder: (BuildContext context, int index) {
          final country = countries.elementAt(index);
          return buildCountry(country);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }

  Widget buildCountry(Country country) => GestureDetector(
        onTap: () => openCountryCard(country),
        child: ListTile(
          leading: Image.network(
            country.flagUrl,
            fit: BoxFit.contain,
            width: 50,
            height: 50,
          ),
          title: Text(country.name),
          subtitle: Text(country.fullName),
        ),
      );

  void openCountryCard(Country country) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CountryCard(country: country),
      ),
    );
  }
}
