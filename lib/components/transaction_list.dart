import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {

  final List <Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions,this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {  

          final tr = transactions[index];

          return Card(
            elevation: 5,
            margin:EdgeInsets.symmetric(
              vertical:8,
              horizontal:5
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius:30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('R\$${tr.value}')
                  ),
                ),
              ),
              title:
                Text(
                  tr.title,
                  style:Theme.of(context).textTheme.title,
                 ),
              subtitle:
                Text(
                  DateFormat('d MMM y').format(tr.date),
                ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color:Colors.red[300],
                onPressed: () => onRemove(tr.id),
              ),
            ),
          );
        },
      ),
    );
  }
}