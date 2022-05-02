import 'package:countries_from_api/api/countries_api.dart';
import 'package:countries_from_api/models/country.dart';
import 'package:countries_from_api/theme/app_theme.dart';
import 'package:countries_from_api/widgets/country_card.dart';
import 'package:countries_from_api/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List countries = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final countries = await CountriesApi.getCoutries(query);
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
                  buildSearch(),
                  buildListView(),
                ],
              ),
            ),
          ],
        ),
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

  Widget buildSearch() => SearchWidget(
        text: query,
        onChanged: searchCountry,
        hintText: 'Type country name',
      );

  void searchCountry(String query) async {
    final countries = await CountriesApi.getCoutries(query);
    setState(() {
      this.query = query;
      this.countries = countries;
    });
  }

  void openCountryCard(Country country) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CountryCard(country: country),
      ),
    );
  }
}
