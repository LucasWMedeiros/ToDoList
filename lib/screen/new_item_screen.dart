import 'package:flutter/material.dart';

class NewItemScreen extends StatefulWidget {
  NewItemScreen({Key? key}) : super(key: key);

  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Novo Item'),
      ),
      body: const Center(child: Text('Tela de Adicionar item'),),
    );
  }
}