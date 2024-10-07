import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

class MotivationalTipsPage extends StatefulWidget {
  const MotivationalTipsPage({Key? key}) : super(key: key);

  @override
  State<MotivationalTipsPage> createState() => _MotivationalTipsPageState();
}

class _MotivationalTipsPageState extends State<MotivationalTipsPage> {
  List<String> frases = [''];
  String frase = '';

  Future<void> _adicionarDialogo(BuildContext context) async {
    final result = await showTextInputDialog(
      context: context,
      message: 'Digite a frase que deseja adicionar à sua lista de motivação:',
      textFields: const [
        DialogTextField(
          hintText: 'Digite sua frase aqui',
        ),
      ],
    );

    // Se o resultado não for nulo e contiver a frase, adiciona à lista
    if (result != null && result.isNotEmpty) {
      setState(() {
        frases.add(result[0]);
      });
    }
  }


  int sorteioIndex() {
    Random random = new Random();
    int resultado = random.nextInt(frases.length);
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(onTap: () {
           _adicionarDialogo(context);
          }, child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(Icons.add_box_sharp, color: Colors.white,),
          ))
        ],
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'Frase Motivacional de Hoje',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Frase motivacional de hoje: '),
              SizedBox(height: 30,),
              Text('${frase}', textAlign: TextAlign.center, style: TextStyle(fontSize: 35),),
              SizedBox(height: 30,),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red)),
                  onPressed: () {
                    setState(() {
                      var sorteio = sorteioIndex();
                      frase = frases[sorteio];
                    });
                  },
                  child: Text(
                    'Sortear Frase',
                    style: TextStyle(color: Colors.white),
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
