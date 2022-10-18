import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(),
    );
  }
}

class Student {
  String name;
  int projectPoint;
  int additionalPoint;

  Student(this.name, this.projectPoint, this.additionalPoint);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Student> studentList = [
    Student("John", 83, 0),
    Student("Tony", 21, 0),
    Student("Kim", 76, 0)
  ];
  late Student student = Student("", 0, 0);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Grade Calculator'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ],
            bottom: const TabBar(
              tabs: [Tab(text: 'Information'), Tab(text: 'List')],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Form(
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insert some texts.';
                            } else if (int.tryParse(value) != null) {
                              return 'Please enter some string, not a number.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            student.name = value!;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Project point'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insert some texts.';
                            } else if (int.tryParse(value) == null) {
                              return 'Please enter some integer.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            student.projectPoint = int.parse(value!);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField(
                          items: List.generate(11, (index) {
                            if (index == 0) {
                              return DropdownMenuItem(
                                  value: index,
                                  child: const Text(
                                      "Choose the additional point"));
                            }
                            return DropdownMenuItem(
                                value: index,
                                child: Text('${index - 1} point'));
                          }),
                          onChanged: (value) {
                            setState(() {
                              student.additionalPoint = value! - 1;
                            });
                          },
                          validator: (value) {
                            if (value == 0) {
                              return 'Please select the point';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.indigo,
                          height: 50,
                          width: 150,
                          child: GestureDetector(
                            child: const Center(
                              child: Text("Enter",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                            ),
                            onTap: () {
                              setState(() {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Processing Data")));
                                  _formKey.currentState!.save();
                                  studentList.add(student);
                                  _formKey = GlobalKey<FormState>();
                                  student = Student("", 0, 0);
                                }
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ReorderableListView.builder(
                itemCount: studentList.length,
                itemBuilder: (c, i) {
                  return Dismissible(
                    background: Container(
                      color: Colors.green,
                    ),
                    key: ValueKey(studentList[i]),
                    child: ListTile(
                      title: Text(
                          '${studentList[i].name}: ${studentList[i].projectPoint + studentList[i].additionalPoint}'),
                      leading: const Icon(Icons.home),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        studentList.removeAt(i);
                      });
                    },
                  );
                },
                onReorder: (int oldIndex , int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    studentList.insert(newIndex, studentList.removeAt(oldIndex));
                  });
                },
              )
            ],
          ),
        ));
  }
}
