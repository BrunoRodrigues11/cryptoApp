import 'package:cryptoapp/myApp.dart';
import 'package:cryptoapp/repository/favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesRepository(),
      child: const MyApp()
      ),
    );
}