// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, use_super_parameters, file_names, prefer_const_constructors, sort_child_properties_last, avoid_print, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:habit_tracker_app/services/lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  bool isDarkMode = false; // Toggle for dark mode

  @override
  Widget build(BuildContext context) {
    void addToHabitList(String habitName, String habitDescription) {
      habitList.add([false, habitName, habitDescription, Icon(Icons.abc)]);
    }

    void addHabit(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            TextEditingController habitNameController =
                TextEditingController(text: "Habit Name");
            TextEditingController habitDescriptionController =
                TextEditingController(text: "Habit Description");
            return AlertDialog(
              title: Text("Add a Habit"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: habitNameController,
                  ),
                  TextFormField(
                    controller: habitDescriptionController,
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.deepPurple),
                        surfaceTintColor:
                            WidgetStateProperty.all(Colors.purpleAccent)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.deepPurple),
                        surfaceTintColor:
                            WidgetStateProperty.all(Colors.purpleAccent)),
                    onPressed: () {
                      setState(() {
                        addToHabitList(habitNameController.text,
                            habitDescriptionController.text);
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Save"))
              ],
            );
          });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: (() {
          addHabit(context);
        }),
      ),
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[100],
      body: ListView(padding: EdgeInsets.zero, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(children: [
              Image.asset('assets/MainBackground.png'),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 140, 0, 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: isDarkMode
                        ? Colors.black.withOpacity(0.7)
                        : Colors.black.withOpacity(0.3), // Background color
                    child: Column(children: [
                      Text(
                        "Hey RITWIZ!",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "You have ${habitList.length - counter} habits left for today",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: isDarkMode ? Colors.white : Colors.white),
                      ),
                    ]),
                  ),
                ),
              )
            ]),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: isDarkMode ? Colors.black : Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SwitchListTile(
                  title: Text('Dark Mode',
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black)),
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Keep Going!",
                        style: TextStyle(
                            color:
                                isDarkMode ? Colors.white70 : Colors.grey[600],
                            fontSize: 16),
                      ),
                      Text("${((counter / habitList.length) * 100).round()}%",
                          style: TextStyle(
                              color: isDarkMode
                                  ? Colors.white70
                                  : Colors.grey[600],
                              fontSize: 16))
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                        minHeight: 12,
                        color: Colors.deepPurpleAccent,
                        backgroundColor: Color.fromARGB(255, 192, 170, 250),
                        value: (counter / habitList.length)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Divider(),
                ),
                SizedBox(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: habitList.length,
                    itemBuilder: (context, int index) {
                      return ListTile(
                          title: Text(habitList[index][1],
                              style: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black)),
                          subtitle: Text(habitList[index][2],
                              style: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white70
                                      : Colors.black87)),
                          trailing: habitList[index][3],
                          leading: Checkbox(
                            value: habitList[index][0],
                            onChanged: ((value) {
                              setState(() {
                                if (value == false) {
                                  counter -= 1;
                                  habitList[index][0] = value;
                                } else
                                  counter += 1;
                                habitList[index][0] = value;
                              });
                            }),
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
