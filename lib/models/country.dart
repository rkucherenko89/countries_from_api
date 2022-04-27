class Country {
  final String name;
  final String fullName;
  final String flagUrl;

  Country({
    required this.name,
    required this.fullName,
    required this.flagUrl,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
       
        /// Верхняя часть для апишки версии 3.1. Нижняя для версии 2.
        /// Для переключения надо поменять адресс [CountriesApi]
       
        // name: json['name']['common'],
        // fullName: json['name']['official'],
        // flagUrl: json['flags']['png'],
        name: json['name'],
        fullName: json['capital'] ?? '',
        flagUrl: json['flags']['png'],
      );
}
