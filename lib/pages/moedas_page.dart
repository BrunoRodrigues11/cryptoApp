import 'package:cryptoapp/model/moeda_model.dart';
import 'package:cryptoapp/repository/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Moeda> selecionadas = [];

  appBarDinamica(){
    if (selecionadas.isEmpty) {
      return AppBar(
          title: const Text("Cripto Moedas"),
      );      
    } else {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          }, 
          icon: const Icon(
            Icons.arrow_back
          )
        ),
        title: Text(
          "${selecionadas.length} selecionadas",
        ),
        backgroundColor: Colors.blueGrey[50],
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Colors.black87
        ),
        toolbarTextStyle: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18
          )
        ).bodyMedium, titleTextStyle: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18
          )
        ).titleLarge,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda){
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            leading: (selecionadas.contains(tabela[moeda]))
            ? const CircleAvatar(
              child: Icon(
                Icons.check
              ),
            )
            : SizedBox(
              width: 40,
              child: Image.asset(tabela[moeda].icone),
            ),
            title: Text(
              tabela[moeda].nome,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              real.format(tabela[moeda].preco)
            ),
            selected: selecionadas.contains(tabela[moeda]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                (selecionadas.contains(tabela[moeda]))
                  ? selecionadas.remove(tabela[moeda])
                  : selecionadas.add(tabela[moeda]
                );
              });
            },
          );
        }, 
        padding: const EdgeInsets.all(15),
        separatorBuilder: (_,__) => const Divider(), 
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas. isNotEmpty 
        ? FloatingActionButton.extended(
          onPressed: () {}, 
          icon: const Icon(
            Icons.star
          ),
          label: const Text(
            "FAVORITAR",
            style: TextStyle(
              letterSpacing: 0,
              fontWeight: FontWeight.bold
            ),
          )
        )
        : null,
    );
  }
}