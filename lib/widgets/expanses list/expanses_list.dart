import 'dart:math';

import 'package:expenses_app/Models/expanses.dart';
import 'package:expenses_app/widgets/expanses%20list/expanses_item.dart';
import 'package:flutter/material.dart';
class ExpansesList extends StatelessWidget {
  const ExpansesList({
    super.key,
    required this.expanses,
    required this.onRemoveExpanses,
  });

  final List<Expansesmodel> expanses;
  final Function(Expansesmodel) onRemoveExpanses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expanses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expanses[index]),
        background: Container(
          color: Colors.red,
        ),
        // Bug 6: 
        onDismissed: (direction) => onRemoveExpanses(expanses[index]),
        //remove first list
        child: expansesItem(expanses: expanses[index]),
      ),
    );
  }
}