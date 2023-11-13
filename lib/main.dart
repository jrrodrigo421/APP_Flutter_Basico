import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferências'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(
                fontSize: 26.0,
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 26.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on_outlined),
                labelText: 'Valor',
                hintText: '00.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                debugPrint('Clicou no botão');
                debugPrint('teste  -- ${_controladorCampoValor.text}');
                debugPrint('teste  -- ${_controladorCampoNumeroConta.text}');

                final int? numeroConta =
                    int.tryParse(_controladorCampoNumeroConta.text);
                final double? valor =
                    double.tryParse(_controladorCampoValor.text);

                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor: valor, numeroConta: numeroConta);
                  debugPrint('$transferenciaCriada');
                }
              },
              child: Text('Confirmar'))
        ],
      ),
    );
  }
}

class listaTransf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfências'),
      ),
      body: Column(
        children: [
          ItemTransf(Transferencia(valor: 2000.00, numeroConta: 0001)),
          ItemTransf(Transferencia(valor: 3000.00, numeroConta: 0002)),
          ItemTransf(Transferencia(valor: 4000.00, numeroConta: 0003)),
          ItemTransf(Transferencia(valor: 5000.00, numeroConta: 00014)),
          ItemTransf(Transferencia(valor: 1000.00, numeroConta: 0055)),
          ItemTransf(Transferencia(valor: 20800.00, numeroConta: 0001)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Pressionado');
        },
        child: Icon(Icons.add),
      ),
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
  final int numeroConta;

  Transferencia({required this.valor, required this.numeroConta});

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
