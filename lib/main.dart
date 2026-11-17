import 'package:flutter/material.dart'; 
import 'screen/home_screen.dart'; 
  import 'package:provider/provider.dart'; 
  import 'providers/favoris_model.dart';
void main() { 
  runApp(const RihlaApp()); 
} 
  
class RihlaApp extends StatelessWidget { 
  const RihlaApp({super.key}); 
  
  @override 
  Widget build(BuildContext context) { 
    void main() { 
      runApp( ChangeNotifierProvider( 
      create: (_) => FavorisModel(), 
      child: const RihlaApp(),
       ), ); }
    return MaterialApp( 
      title: 'Rihla', 
      debugShowCheckedModeBanner: false, 
      theme: ThemeData( 
        useMaterial3: true, 
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0E7C86)), 
      ), 
      home: const HomeScreen(), 
    ); 
    
  } } 