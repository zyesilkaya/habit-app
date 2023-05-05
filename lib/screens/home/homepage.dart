import 'package:brew_crew/screens/habitPage.dart';
import 'package:brew_crew/screens/home/deneme.dart';
import 'package:brew_crew/widgets/habitItem.dart';
import 'package:flutter/material.dart';
import '../models/habit.dart';

class HomePage extends StatefulWidget {
 const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Habit> habitList = Deneme.habitList;
  final _todoController = TextEditingController();
  final List<int> colorCodes = <int>[500, 300, 100];
  final _formKey = GlobalKey<FormState>();
  String smth = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: habitList.length,
        itemBuilder: (BuildContext context, int index) {
          return habitItem(habit: habitList[index], onToDoChanged: (Habit habit){
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              isDismissible: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(16))),
              builder: (context) => DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.75,
                expand: false,
                builder: (_, controller) => Column(
                  children: [
                    Icon(
                      Icons.remove,
                      color: Colors.grey[600],
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: controller,
                        itemCount: 50,
                        itemBuilder: (_, index) {
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("Element at index($index)"),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          , onDeleteItem: Deneme.deleteItem);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[400],
        onPressed: (){
          setState(() {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Stack(
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  onChanged: (String f){
                                    this.smth = f;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  child: Text("Submit"),
                                  onPressed: () {
                                    setState(() {
                                      habitList.add(new Habit(id: smth, habitText: smth));
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          });

        },
        child: Icon(Icons.add),

      ),

    );
  }
}
