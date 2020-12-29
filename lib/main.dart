import 'package:AppFinancas/models/transaction.dart';
import 'package:flutter/material.dart';
main()=> runApp(ExpensesApp());
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tenis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),

    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 230.76,
      date: DateTime.now(),
    )

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Despesas"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              child: Text("Grafico"),
              elevation: 5,
              color:Colors.blue,
            ),
          ),
          Container(
            child: Card(child:Text("Lista de despesas"),
            ),
          ),
        ]
      )
    );
  }
}