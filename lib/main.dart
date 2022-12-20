import 'package:flutter/material.dart';
import 'package:flutter_ayakkabi_uygulama/screens/home_shoe_screet.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayakkabi Uygulamasi',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
        
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      home: const HomePage(),
    );
  }
}