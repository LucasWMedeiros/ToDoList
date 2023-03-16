// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/components/itens_list.dart';
import 'package:todolist/model/item_model.dart';
import 'package:todolist/components/new_item_form.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime date = DateTime.now();
  bool isChecked = false;

  _addNewitem(String title, DateTime? date) {
    final newItem = ItemModel(
      id: Random().nextDouble().toString(),
      title: title,
      limiteDate: date
    );

    setState(() {
    itemList.add(newItem);
    });

    Navigator.of(context).pop();
  }

  _openNewItemForm() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return NewItemForm(_addNewitem);
        });
  }

  _onChangedCheck(bool value, int index) {
    setState(() {
      itemList[index].completed = value;
    });
  }

  _removeItem(String id) {
    setState(() {
      itemList.removeWhere((element) => element.id == id);
    });
  }

  List<ItemModel> itemList = [
    ItemModel(
        id: '2',
        title: 'Isso é um compromisso',
        limiteDate: DateTime.now(),
        completed: true),
    ItemModel(
        id: '1',
        title: 'Isso é uma Tarefa',
        limiteDate: DateTime.now().subtract(Duration(days: 2)),
        completed: false),
    ItemModel(
        id: '3',
        title: 'Isso é uma Tarefa 02',
        limiteDate: DateTime.now(),
        completed: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coisas a fazer'),
        actions: [
          IconButton(
            onPressed: () {
              _openNewItemForm();
            },
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(child: ItemsList(itemList, _onChangedCheck, _removeItem)),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: _openNewItemForm,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add),
            // Text('Adicionar')
          ],
        ),
      ),
    );
  }
}

// Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Card(
//               elevation: 10,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Checkbox(value: false, onChanged: (_) {}),
//                   Text('Terminar Projeto Flutter'),
//                   Text(
//                     'Data indeterminada',
//                     style: TextStyle(fontSize: 10),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.delete),
//                   )
//                 ],
//               ),
//             ),
//           ),