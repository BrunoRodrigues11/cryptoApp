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

  setPaginaAtual(pagina){
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setPaginaAtual,
        children: const [
          MoedasPage(),
          FavoritesPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list
            ),
            label: "Todas"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star
            ),
            label: "Favoritas"
          )
        ],
        onTap: (pagina){
          pc.animateToPage(
            pagina, 
            duration: const Duration(
              milliseconds: 400
            ), 
            curve: Curves.ease
          );
        },
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}