import 'package:cryptoapp/repository/favorite_repository.dart';
import 'package:cryptoapp/widgets/moedaCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moedas Favoritas'),
      ),
      body: Container(
        color: Colors.indigo.withOpacity(0.05),
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12),
        child: Consumer<FavoritesRepository>(
          builder: (context, favoritas, child){
            return favoritas.lista.isEmpty
            ? const ListTile(
              leading: Icon(
                Icons.star,
              ),
              title: Text(
                "Ainda não há moedas favoritas"
              ),
            )
            : ListView.builder(
              itemCount: favoritas.lista.length,
              itemBuilder: (_, index){
                return MoedaCard(
                  moeda: favoritas.lista[index]
                );
              }
            );
          },
        ),
      ),
    );
  }
}