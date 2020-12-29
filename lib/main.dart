import 'package:flutter/material.dart';
import './components/transaction_user.dart';

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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Despesas"),
        backgroundColor:Colors.green[800],
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
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}