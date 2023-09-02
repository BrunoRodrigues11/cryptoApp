import 'package:flutter/material.dart';
import 'package:cryptoapp/pages/favoritesPage.dart';
import 'package:cryptoapp/pages/moedas_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;


  @override
  void initState() {
    super.initState();
    pc = PageController(
      initialPage: paginaAtual
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          MoedasPage(),
          FavoritesPage(),
        ],
      ),
    );
  }
}