import 'package:countries_from_api/pages/home_page.dart';
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
          textTheme: GoogleFonts.akayaTelivigalaTextTheme(
            Theme.of(context).textTheme,
          )),
      initialRoute: '/',
      routes: {
        '/countryPage': (context) => const HomePage(),
      },
      home: const HomePage(),
    );
  }
}
