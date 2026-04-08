import 'package:expenses_app/Models/expanses.dart';
import 'package:expenses_app/widgets/chart/chart.dart';
import 'package:expenses_app/widgets/expanses%20list/expanses_list.dart';
import 'package:expenses_app/widgets/new_expanses.dart';
import 'package:flutter/material.dart';

class Expanses extends StatefulWidget {
  const Expanses({super.key});

  @override
  State<Expanses> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
  final List<Expansesmodel> _registeredExpanses = [
    Expansesmodel(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expansesmodel(
      title: 'Cinema',
      amount: 15.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expansesmodel(
      title: 'Groceries',
      amount: 45.23,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expansesmodel(
      title: 'Trip',
      amount: 150.00,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];
  void _addExpanses(Expansesmodel expanses) {

   // Bug 4:
   setState(() {
      _registeredExpanses.add(expanses);
   });
     
  //if funcation cant add use setstate
  }

  void _removeExpanses(Expansesmodel expanses) {
    setState(() {
      _registeredExpanses.remove((expanses));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanses Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => NewExpanses(onAddExpanses: _addExpanses),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Chart(expenses: _registeredExpanses),
            Expanded(
              child: ExpansesList(
                expanses: _registeredExpanses,
                onRemoveExpanses: _removeExpanses,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
