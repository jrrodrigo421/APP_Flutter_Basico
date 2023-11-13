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
        ItemTransf(Transferencia(valor: 2000.00, numeroConta: 0001)),
        ItemTransf(Transferencia(valor: 3000.00, numeroConta: 0002)),
        ItemTransf(Transferencia(valor: 4000.00, numeroConta: 0003)),
        ItemTransf(
          Transferencia(valor: 5000.00, numeroConta: 00014),
        ),
        ItemTransf(Transferencia(valor: 1000.00, numeroConta: 0055)),
        ItemTransf(Transferencia(valor: 20800.00, numeroConta: 0001)),
      ],
    );
  }
}

class ItemTransf extends StatelessWidget {
  final Transferencia _transf;

  ItemTransf(this._transf);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transf.valor.toString()),
        subtitle: Text(_transf.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final double numeroConta;

  Transferencia({required this.valor, required this.numeroConta});
}
