import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  double _valorDolar = 5.05;
  double _valorEuro = 5.60;

  late TextEditingController _moedaE;

  late TextEditingController _moedaD;

  @override
  void initState() {
    super.initState();
    _moedaE = TextEditingController();
    _moedaD = TextEditingController();
  }

  calcValorE() {
    double currentMoeda = double.tryParse(_moedaE.text) ?? 0;
    double valorEuro = currentMoeda / _valorEuro;

    // exibindo o resultado
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Valor: ${valorEuro.toStringAsFixed(2)}')));
  }

  calcValorD() {
    double currentMoeda = double.tryParse(_moedaD.text) ?? 0;
    double valorDolar = currentMoeda / _valorDolar;

    // exibindo o resultado
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Valor: ${valorDolar.toStringAsFixed(2)}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MoneyConv'),
        ),
        body: Align(
            child: Container(
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Cálculo da Coverção da Moeda',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _moedaE,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                      ],
                      autofocus: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Real pra Euro'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () => calcValorE(),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Text("Calcular por Euro")),
                    TextField(
                      controller: _moedaD,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                      ],
                      autofocus: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Real pra Dolar'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () => calcValorD(),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Text("Calcular por Dolar"))
                        
                  ],
                ))));
  }
}
