
import 'package:countries_from_api/api/countries_api.dart';
import 'package:countries_from_api/main.dart';
import 'package:countries_from_api/models/country.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      body: Column(
        children: [
          buildSearch(),
          Expanded(
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
          ),
        ],
      ),
    );
  }

  Widget buildCountry(Country country) => GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CountryCard(flag: country.flagUrl))),
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
}
