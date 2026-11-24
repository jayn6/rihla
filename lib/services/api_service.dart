import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:http/http.dart' as http;
 
import '../config/api_config.dart';
import '../models/destination.dart';
import '../models/reservation.dart';
 
class ApiService {
  static const _cleCache = 'cache_destinations';

static bool depuisCache = false;
static List<Destination> _decoder(String corps) {
  return (jsonDecode(corps) as List)
      .map((e) => Destination.fromJson(e))
      .toList();
}
  static Uri _url(String chemin) => Uri.parse('${ApiConfig.baseUrl}$chemin');
 

static Future<List<Destination>> getDestinations() async {
  final prefs = await SharedPreferences.getInstance();

  try {
    final reponse = await http
        .get(_url('/destinations'))
        .timeout(ApiConfig.timeout);

    if (reponse.statusCode != 200) {
      throw Exception('Erreur ${reponse.statusCode}');
    }

    final corps = utf8.decode(reponse.bodyBytes);

    await prefs.setString(_cleCache, corps);

    depuisCache = false;

    return _decoder(corps);

  } catch (e) {

    final cache = prefs.getString(_cleCache);

    if (cache == null) {
      rethrow;
    }

    depuisCache = true;

    return _decoder(cache);
  }
}


 
    // TODO 4 : si statusCode n'est pas 200, lancer une Exception
    //          avec un message contenant le code
 
    // utf8.decode garde les accents (Médenine, Désert...)
    final List<dynamic> liste = jsonDecode(utf8.decode(reponse.bodyBytes));
  return liste.map((json) => Destination.fromJson(json)).toList();
    // TODO 5 : transformer chaque élément de liste en Destination
    //          (map + Destination.fromJson + toList)
  }
  static Future<String> creerReservation(Reservation reservation) async {
  final reponse = await http
      .post(
        _url('/reservations'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(reservation.toJson()),
      )
      .timeout(ApiConfig.timeout);
 
  // TODO 4 : si le code n'est pas 201, lancer une Exception
 if (reponse.statusCode != 201) {
    throw Exception('Erreur ${reponse.statusCode} lors de la création de la réservation');
  }
  final Map<String, dynamic> creee = jsonDecode(utf8.decode(reponse.bodyBytes));
  return creee['id'].toString();   // l'id attribué par le serveur
}

}
