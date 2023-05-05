import 'package:brew_crew/widgets/habitItem.dart';

import '../models/habit.dart';

class Deneme{

  static List<Habit> habitList = [];

  static void addItem(Habit item){
    habitList.add(item);
  }

  static void deleteItem(Habit item){
    habitList.remove(item);
  }


}
