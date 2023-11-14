import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
     home: ListaTransf(),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: "Número da conta:",
              dica: "XXXX",
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: "Valor:",
              dica: "0.00",
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text('Confirmar'))
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada =
          Transferencia(valor: valor, numeroConta: numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  const Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransf extends StatefulWidget {
  final List<Transferencia> _transferencia = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransf> {
  @override
  Widget build(BuildContext context) {
    // widget._transferencia.add(Transferencia(valor: 3000, numeroConta: 5555));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfências'),
      ),
      body: ListView.builder(
          itemCount: widget._transferencia.length,
          itemBuilder: ( context,  index) {
            final transferencia = widget._transferencia[index];
            return ItemTransf(transferencia);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<dynamic> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia(); 
          }));
          future.then((transferenciaRecebida) {
            print('Vau chegar grana');
            debugPrint(transferenciaRecebida.toString());

            setState(() {
              widget._transferencia.add(transferenciaRecebida);

            });

            print('Printando widget ${widget._transferencia}');
          });
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
