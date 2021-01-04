import 'package:AppFinancas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'dart:math';
import './models/transaction.dart';

main()=> runApp(ExpensesApp());
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   final _transactions = [

    Transaction(
      id:'t1',
      title: 'novo tenis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id:'t2',
      title: 'novo tenis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id:'t3',
      title: 'novo tenis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

  }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Despesas"),
        backgroundColor:Colors.green[800],
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed:()=> _openTransactionFormModal(context),
            iconSize:35,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                child: Text("Grafico"),
                elevation: 10,
                color:Colors.green[800],
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
    );
  }
}