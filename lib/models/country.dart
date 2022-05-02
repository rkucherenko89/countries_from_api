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
  final String region;
  final String subregion;
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
    required this.region,
    required this.subregion,
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
        region: json['region'] ?? '',
        subregion: json['subregion'] ?? '',
        borders: json['borders']?.join(', ') ?? '',
      );
}
