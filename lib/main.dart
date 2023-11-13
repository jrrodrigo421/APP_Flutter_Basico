import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: const Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('100.00'),
              subtitle: Text('1000'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('100.00'),
              subtitle: Text('1000'),
            ),
          ),
        ],
      ),
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
