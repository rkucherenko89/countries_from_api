import 'package:countries_from_api/pages/home_page.dart';
import 'package:countries_from_api/widgets/country_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Countries';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // textTheme: GoogleFonts.whisperTextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/countryPage': (context) => HomePage(),
      },
      home: const HomePage(),
    );
  }
}
