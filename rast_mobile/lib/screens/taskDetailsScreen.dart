import 'package:flutter/material.dart';
import 'package:rast_mobile/screens/homeScreen.dart';

import '../consts.dart';
import '../model/model.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class TaskDetailsScreen extends StatefulWidget {
  static String rout = "/taskDetails";
  final int? cardIndex;
  final String? status;

  const TaskDetailsScreen({super.key, this.cardIndex, this.status});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  int myColor = 4294967295;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Image.asset(
              "images/logo.png",
              width: 70,
              height: 35,
              color: Colors.white,
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            ]),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: myWidth * 0.8,
                        child: Text(
                          getTaskTitle(
                              widget.cardIndex as int, widget.status as String),
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Euclid Circular A',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => Center(
                                child: AlertDialog(
                                  content: MaterialColorPicker(
                                    onColorChange: (Color color) {
                                      // Handle color changes
                                      myColor = color.value;
                                    },
                                    selectedColor: Colors.red,
                                    colors: const [
                                      Colors.grey,
                                      Colors.red,
                                      Colors.blue,
                                      Colors.yellow,
                                      Colors.lightGreen,
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          updateItem(
                                              widget.cardIndex,
                                              widget.status,
                                              myColor.toString(),
                                              true);
                                          Navigator.pop(context, "yeniDeger");
                                        },
                                        child: const Text("choose"))
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            size: 30,
                            Icons.color_lens_sharp,
                            color: Theme.of(context).primaryColor,
                          )),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: myHeight / 20,
                    child: Row(children: [
                      Image.asset(
                        "images/Ellipse2.png",
                      ),
                      const Text(
                        'Reported by',
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Euclid Circular A',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        'Project Manager',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Euclid Circular A',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Send The Task To:",
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Euclid Circular A',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () async {
                                //// send the task to the next lavle
                                await updateItem(widget.cardIndex,
                                    widget.status, myColor.toString(), false);
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                              },
                              child: Text(nextLavleButton()),
                              //const Text('To Do'),
                            ),
                          ],
                        ),
                        Text(
                          getTaskDate(
                              widget.cardIndex as int, widget.status as String),
                          //'06.08.2023',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Euclid Circular A',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ]),
                  const SizedBox(height: 25),
                  const Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Euclid Circular A',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: myWidth * 0.9,
                    height: 200,
                    decoration: ShapeDecoration(
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Container(
                      height: 170,
                      margin: const EdgeInsets.all(25),
                      child: Text(
                        //Description
                        getTaskdesc(
                            widget.cardIndex as int, widget.status as String),
                        style: const TextStyle(
                          overflow: TextOverflow.fade,
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Euclid Circular A',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(
                        //   width: myWidth / 15,
                        height: myHeight / 20,
                        child: Image.asset(
                          "images/Ellipse1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        //  width: myWidth / 15,
                        height: myHeight / 20,
                        child: Image.asset(
                          "images/Ellipse4.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
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
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, HomeScreen.rout);
                    },
                    child: const Icon(Icons.home_outlined)),
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
        ]));
  }

//'Backlog', 'To Do', 'In Progress', 'Done'
  String nextLavleButton() {
    switch (widget.status) {
      case "Backlog":
        return "ToDo";
      case "ToDo":
        return "In Progress";
      case "Inprogress":
        return "Done";
      case "Done":
        return "Backlog";
    }
    return "";
  }
}
