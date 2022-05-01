class Country {
  final String name;
  final String fullName;
  final String flagUrl;
  final String capital;
  final String domain;
  final int population;
  final double area;
  final List languages;
  final String currencies;
  final String timezones;
  final String continents;
  final String borders;

  Country({
    required this.name,
    required this.fullName,
    required this.flagUrl,
    required this.capital,
    required this.domain,
    required this.population,
    required this.area,
    required this.languages,
    required this.currencies,
    required this.timezones,
    required this.continents,
    required this.borders,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name']['common'],
        fullName: json['name']['official'],
        flagUrl: json['flags']['png'],
        capital: json['capital']?[0] ?? '',
        domain: json['tld']?[0] ?? '',
        population: json['population'],
        area: json['area'],
        languages: json['languages']?.values.toList() ?? [],
        currencies: json['currencies']?.values.elementAt(0)?['name'] ?? '',
        timezones: json['timezones']?.join(', ') ?? '',
        continents: json['continents']?.join(', ') ?? '',
        borders: json['borders']?.join(', ') ?? '',
      );
}
