import 'package:flutter/material.dart';

class NewItemForm extends StatefulWidget {
  NewItemForm({Key? key}) : super(key: key);

  @override
  State<NewItemForm> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Tela de Adicionar item'),),
    );
  }
}