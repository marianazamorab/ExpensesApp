import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _trans;

  TransactionList(this._trans, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _trans.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Text('\$${_trans[index].amount}'),
                      ),
                    ),
                    title: Text(
                      _trans[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_trans[index].date),
                    ),
                    trailing: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor, onPressed: () => deleteTx(_trans[index].id)),
                  ),
                );
              },
              itemCount: _trans.length,
            ),
    );
  }
}

// itemBuilder: (ctx, index) {
//                 return Card(
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                           vertical: 15,
//                           horizontal: 15,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Theme.of(context).primaryColorDark,
//                             width: 2,
//                           ),
//                         ),
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           '\$${_trans[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Theme.of(context).primaryColorDark,
//                           ),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             _trans[index].title,
//                             style: TextStyle(
//                               fontSize: 25,
//                             ),
//                           ),
//                           Text(
//                             DateFormat.yMMMMd("en_US")
//                                 .format(_trans[index].date),
//                             style: TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),