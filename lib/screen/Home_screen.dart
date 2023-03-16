// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/components/itens_list.dart';
import 'package:todolist/model/item_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime date = DateTime.now();
  bool isChecked = false;
  List<ItemModel> list = [
    ItemModel(
        title: 'Isso é um compromisso',
        limiteDate: DateTime.now(),
        completed: true),
    ItemModel(
        title: 'Isso é uma Tarefa',
        limiteDate: DateTime.now().subtract(Duration(days: 2)),
        completed: false),
    ItemModel(
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
              print(DateTime.now().subtract(Duration(days: 2)));
            },
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(child: ItemsList(list)),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () {},
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