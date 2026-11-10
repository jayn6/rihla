import 'dart:convert';
 
import 'package:http/http.dart' as http;
 
import '../config/api_config.dart';
import '../models/destination.dart';
 
class ApiService {
  static Uri _url(String chemin) => Uri.parse('${ApiConfig.baseUrl}$chemin');
 
  static Future<List<Destination>> getDestinations() async {
    final reponse = await http
        .get(_url('/destinations'))
        .timeout(ApiConfig.timeout);
    if (reponse.statusCode !=200){
      throw Exception('Erreur ${reponse.statusCode} lors de la récupération des destinations');
    }

 
    // TODO 4 : si statusCode n'est pas 200, lancer une Exception
    //          avec un message contenant le code
 
    // utf8.decode garde les accents (Médenine, Désert...)
    final List<dynamic> liste = jsonDecode(utf8.decode(reponse.bodyBytes));
  return liste.map((json) => Destination.fromJson(json)).toList();
    // TODO 5 : transformer chaque élément de liste en Destination
    //          (map + Destination.fromJson + toList)
  }
}
