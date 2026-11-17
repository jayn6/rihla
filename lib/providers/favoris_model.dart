import 'package:flutter/foundation.dart';
 import '../models/destination.dart'; 
 /// Favoris partagés par tous les écrans. 
  class FavorisModel extends ChangeNotifier {
  final Map<String, Destination> _favoris = {};

  bool estFavori(Destination d) => _favoris.containsKey(d.id);

  List<Destination> get liste => _favoris.values.toList();

  int get nombre => _favoris.length;

  bool basculer(Destination d) {
    if (_favoris.containsKey(d.id)) {
      _favoris.remove(d.id);
      notifyListeners();
      return false;
    }

    _favoris[d.id] = d;
    notifyListeners();
    return true;
  }
}