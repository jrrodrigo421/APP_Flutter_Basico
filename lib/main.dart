import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: listaTransf(),
      appBar: AppBar(
        title: Text('Transfências'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Pressionado');
        },
        child: Icon(Icons.add),
      ),
    ),
  ));
}

class listaTransf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ItemTransf(
          valor: '300.00',
          numeroConta: '2020',
        ),
        ItemTransf(
          valor: '300.00',
          numeroConta: '2020',
        ),
        ItemTransf(
          valor: '500.00',
          numeroConta: '2021',
        ),
        ItemTransf(
          valor: '600.00',
          numeroConta: '2022',
        ),
        ItemTransf(
          valor: '555.00',
          numeroConta: '2023',
        ),
        ItemTransf(
          valor: '600.00',
          numeroConta: '2024',
        ),
      ],
    );
  }
}

class ItemTransf extends StatelessWidget {
  final String valor;
  final String numeroConta;

  ItemTransf({required this.valor, required this.numeroConta});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(valor),
        subtitle: Text(numeroConta),
      ),
    );
  }
}
