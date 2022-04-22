import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



   DateTime? _selectedDate;
  late DateTime pickedData;

  _showDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now()
    ).then((pickedDate) {
      if (pickedDate == null)
        {
          return;
        }
      setState(() {
         _selectedDate = pickedDate;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
        centerTitle: true,
      ),
      body: Center(
           child: ElevatedButton(
               onPressed: _showDatePicker,
               child:
               Text(
                 _selectedDate == null
                     ? 'nenhuma data selecionada!'
                     : DateFormat('d/MMMM/y').format(_selectedDate!),
               )
           )
       )
    );
  }
}
// MediaQuery.of(context).textScaleFactor para acessibilidade e responsividade da fonte de acordo com o usuário
// constraints.maxHeight