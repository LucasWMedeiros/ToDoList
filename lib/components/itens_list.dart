import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/model/item_model.dart';

class ItemsList extends StatelessWidget {
  final List<ItemModel> itens;
  Function onChanged;
  Function remove;

  ItemsList(this.itens, this.onChanged, this.remove);

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
                    fontStyle:
                        item.completed ? FontStyle.italic : FontStyle.normal,
                    decoration: item.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
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
                        : Colors.grey,
                    decoration: item.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => remove(item.id),
              ),
            ));
      },
    );
  }
}
