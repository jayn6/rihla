import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/favoris_model.dart';
import 'screen/home_screen.dart';
import 'providers/reglages_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavorisModel()..charger(),
        ),

        ChangeNotifierProvider(
          create: (_) => ReglagesModel()..charger(),
        ),
      ],
      child: const RihlaApp(),
    ),
  );
}

class RihlaApp extends StatelessWidget {
  const RihlaApp({super.key});

  @override
  Widget build(BuildContext context) {
      final sombre = context.watch<ReglagesModel>().sombre;

    return MaterialApp(
      title: 'Rihla',
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
      ),
    ),
       darkTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
    ),
    themeMode: sombre
        ? ThemeMode.dark
        : ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}