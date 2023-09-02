import 'dart:collection';
import 'package:cryptoapp/model/moeda_model.dart';
import 'package:flutter/material.dart';

class FavoritesRepository extends ChangeNotifier{
  List<Moeda> _lista = [];

  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  saveAll(List<Moeda> moedas){
    moedas.forEach((moeda) {
        if (! _lista.contains(moeda)) _lista.add(moeda);
      }
    );
    notifyListeners();
  }

  remove(Moeda moeda){
    _lista.remove(moeda);
    notifyListeners();
  }
}