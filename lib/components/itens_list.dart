import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/model/item_model.dart';

class ItemsList extends StatelessWidget {
  final List<ItemModel> itens;
  Function onChanged;

  ItemsList(this.itens, this.onChanged);

  bool? isChecked;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itens.length,
      itemBuilder: (ctx, index) {
        final item = itens[index];
        return Card(
            elevation: 10,
            child: ListTile(
              leading: Checkbox(
                value: item.completed,
                onChanged: (value) => onChanged(value, index),
              ),
              title: Text(
                item.title,
                style: TextStyle(
                  fontStyle: item.completed ? FontStyle.italic : FontStyle.normal,
                  decoration: item.completed ? TextDecoration.lineThrough : TextDecoration.none
                ),
              ),
              subtitle: Text(
                item.limiteDate != null
                    ? item.limiteDate!.isBefore(
                                DateTime.now().subtract(Duration(days: 1))) &&
                            item.completed == false
                        ? '!${DateFormat('dd MMM y').format(item.limiteDate!)}'
                        : DateFormat('dd MMM y').format(item.limiteDate!)
                    : 'Data indeterminada',
                style: TextStyle(
                    color: item.limiteDate!.isBefore(
                                DateTime.now().subtract(Duration(days: 1))) &&
                            item.completed == false
                        ? Colors.red
                        : Colors.grey),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ));
      },
    );
  }
}