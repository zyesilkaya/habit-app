class Habit {
  String? id;
  String habitText;
  bool isDone;

  Habit({
    required this.id,
    required this.habitText,
    this.isDone = false,
  });

  static List<Habit> HabitList() {
    return [
      Habit(id: '01', habitText: 'Morning Excercise', isDone: true ),
      Habit(id: '02', habitText: 'Buy Groceries', isDone: true ),
      Habit(id: '03', habitText: 'Check Emails', ),
      Habit(id: '04', habitText: 'Team Meeting', ),
      Habit(id: '05', habitText: 'Work on mobile apps for 2 hour', ),
      Habit(id: '06', habitText: 'Dinner with Jenny', ),
    ];
  }
}