import 'package:cryptoapp/repository/moeda_repository.dart';
import 'package:flutter/material.dart';

class MoedasPage extends StatelessWidget {
  const MoedasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabela = MoedaRepository.tabela;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cripto Moedas"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda){
          return ListTile(
            leading: SizedBox(
              child: Image.asset(tabela[moeda].icone),
              width: 40,
            ),
            title: Text(
              tabela[moeda].nome,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              tabela[moeda].preco.toString()
            ),
          );
        }, 
        padding: const EdgeInsets.all(15),
        separatorBuilder: (_,__) => const Divider(), 
        itemCount: tabela.length,
      )
    );
  }
}