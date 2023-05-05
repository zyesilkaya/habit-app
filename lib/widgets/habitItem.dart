import 'package:brew_crew/screens/models/habit.dart';
import 'package:flutter/material.dart';


class habitItem extends StatelessWidget {
  final Habit habit;
  final onToDoChanged;
  final onDeleteItem;

  const habitItem({
    Key? key,
    required this.habit,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          // print('Clicked on Todo Item.');
          onToDoChanged(habit);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          habit.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blueAccent,
        ),
        title: Text(
          habit.habitText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            decoration: habit.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              // print('Clicked on delete icon');
              onDeleteItem(habit);
            },
          ),
        ),
      ),
    );
  }
}