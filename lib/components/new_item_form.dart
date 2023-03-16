// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewItemForm extends StatefulWidget {
  Function addItem;

  NewItemForm(this.addItem);

  @override
  State<NewItemForm> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemForm> {
  TextEditingController textController = TextEditingController();
  bool undefinedDate = false;

  DateTime? _selectedDate;

  _showDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  _onSubmit() {
    final title = textController.text;

    if (title.isEmpty) {
      return;
    }

    widget.addItem(title, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 30 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextFormField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(labelText: 'Titulo'),
                controller: textController,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    undefinedDate
                        ? 'Data indefinida'
                        : _selectedDate == null
                            ? 'Data não selecionada'
                            : DateFormat('dd MMM y').format(_selectedDate!),
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed:
                        undefinedDate ? null : () => _showDatePicker(context),
                    child: Text(
                      'Selecionar data',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: undefinedDate,
                      onChanged: (value) {
                        setState(() {
                          undefinedDate = value!;
                        });
                      }),
                  Text(
                    'A tarefa nao tem um prazo definido',
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _onSubmit();
                      },
                      child: Text('Salvar Tarefa'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
