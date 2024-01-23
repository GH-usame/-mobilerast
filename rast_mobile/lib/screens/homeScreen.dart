import 'package:flutter/material.dart';
import 'package:rast_mobile/screens/taskDetailsScreen.dart';
import 'package:rast_mobile/widgets/myCard.dart';
import 'package:rast_mobile/widgets/my_textField.dart';

import '../consts.dart';
import '../model/model.dart';
import '../model/service.dart';
import '../widgets/my_comboBox.dart';

class HomeScreen extends StatefulWidget {
  static String rout = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset(
            "images/logo.png",
            //fit: BoxFit.cover,
            width: 70, height: 35,
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //getItemList();
                },
                icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          ]),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: myHeight / 20,
                    width: myWidth / 10,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFDED4FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Image.asset(
                      "images/logo2.png",
                    ),
                  ),
                  title: const Text(
                    "Refactoring for Word Ninja",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Euclid Circular A',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: const Text(
                    'New project for refactoring our app Word ninja',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Euclid Circular A',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                // Backlog Widgets //
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Text(
                        'Backlog',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Euclid Circular A',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${backlogList.isNotEmpty ? backlogList.length : "0"}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Euclid Circular A',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: myHeight / 4.5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            backlogList.isNotEmpty ? backlogList.length : 0,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(5),
                              child: InkWell(
                                child: myCard(index, "Backlog"),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TaskDetailsScreen(
                                          cardIndex: index, status: "Backlog"),
                                    ),
                                  ).then((value) {
                                    setState(() {});
                                  });
                                },
                              ));
                        },
                      ),
                    )),
                // todo Widgets //
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Text(
                        'To Do',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Euclid Circular A',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${toDoList.isNotEmpty ? toDoList.length : "0"}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Euclid Circular A',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: myHeight / 4.5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: toDoList.isNotEmpty ? toDoList.length : 0,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(5),
                              child: InkWell(
                                child: myCard(index, "ToDo"),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TaskDetailsScreen(
                                          cardIndex: index, status: "ToDo"),
                                    ),
                                  ).then((value) {
                                    setState(() {});
                                  });
                                },
                              ));
                        },
                      ),
                    )),
                // In progress Widgets //
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Text(
                        'In progress',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Euclid Circular A',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${inprogressList.isNotEmpty ? inprogressList.length : "0"}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Euclid Circular A',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: myHeight / 4.5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: inprogressList.isNotEmpty
                            ? inprogressList.length
                            : 0,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(5),
                              child: InkWell(
                                child: myCard(index, "Inprogress"),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TaskDetailsScreen(
                                          cardIndex: index,
                                          status: "Inprogress"),
                                    ),
                                  ).then((value) {
                                    setState(() {});
                                  });
                                },
                              ));
                        },
                      ),
                    )),
                // Dowe Widgets //
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Euclid Circular A',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${doneList.isNotEmpty ? doneList.length : "0"}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Euclid Circular A',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: myHeight / 4.5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: doneList.isNotEmpty ? doneList.length : 0,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(5),
                              child: InkWell(
                                child: myCard(index, "Done"),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TaskDetailsScreen(
                                          cardIndex: index, status: "Done"),
                                    ),
                                  ).then((value) {
                                    setState(() {});
                                  });
                                },
                              ));
                        },
                      ),
                    )),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        // /// Bottom bar
        Container(
          height: myHeight / 15,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x19000000), // Gölge rengi ve opaklık
                spreadRadius: 5, // Gölge genişliği
                blurRadius: 5, // Gölge bulanıklığı
                offset: Offset(0, 3), // Gölge konumu (x, y)
              ),
            ],
          ),
          width: myWidth,
          child: Row(
            children: [
              SizedBox(width: myHeight / 30),
              TextButton(
                  onPressed: () {}, child: const Icon(Icons.home_outlined)),
              SizedBox(width: myHeight / 6),
              TextButton(
                onPressed: () {
                  launchURL();
                },
                child: const Text(
                  'Go to Word Ninja',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Euclid Circular A',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        )
      ]),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: _addNewTask,
            tooltip: 'Increment',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Icon(Icons.add),
          ),
          SizedBox(height: myHeight / 15),
        ],
      ),
    );
  }

  _addNewTask() {
    String title = "";
    String desc = "";
    String status = "";
    String assigned = "";
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Add New Task',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              MyTextFilde(
                  txt: 'Title',
                  onChanged: (v) {
                    title = v;
                  },
                  minLines: 1),
              const SizedBox(height: 10),
              MyTextFilde(
                  txt: 'Description',
                  onChanged: (v) {
                    desc = v;
                  },
                  minLines: 5),
              const SizedBox(height: 10),
              myCombobox(
                  onItemSelected: (value) {
                    if (value == "To Do") {
                      status = "ToDo";
                    } else if (value == "In Progress") {
                      status = "Inprogress";
                    } else {
                      status = value;
                    }
                    //print('Selected value: $value');
                  },
                  hint: "status"),
              const SizedBox(height: 10),
              MyTextFilde(
                  txt: 'Assigned',
                  onChanged: (v) {
                    assigned = v;
                  },
                  minLines: 1),
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    if (title != "" &&
                        desc != "" &&
                        status != "" &&
                        assigned != "") {
                      Navigator.of(context).pop();
                      await MyService().setTaskItem(
                          taskName: title,
                          description: desc,
                          tableName: status,
                          assigned: assigned);
                      await getItemList();
                      setState(() {});
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
