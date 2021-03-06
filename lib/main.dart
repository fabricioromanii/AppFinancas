import 'package:AppFinancas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/chart.dart';
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
      home:MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   final List<Transaction> _transactions = [
 
  ];

  List<Transaction> get _recentTransactions {

    return _transactions.where((tr) {
      
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days : 7),
      ));
    }).toList();

  }

  _addTransaction(String title, double value, DateTime date){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id){
    setState( () {
      _transactions.removeWhere( (tr) => tr.id == id);
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
            Chart(
              _recentTransactions
            ),
            TransactionList(_transactions, _removeTransaction),
          ], 
        ),
      ),
    );
  }
}