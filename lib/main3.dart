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
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _midController = TextEditingController();
  final _finalController = TextEditingController();
  double _leaderValue = 0.0;
  int _additionalValue = 0;
  bool _attendance = true;
  String _grade = '';

  @override
  void dispose() {
    _midController.dispose();
    _finalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Calculator'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Mid-term exam'),
                controller: _midController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Final exam',
                ),
                controller: _finalController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              RadioListTile(
                  title: const Text('Project Team Leader (+10)'),
                  value: 10.0,
                  groupValue: _leaderValue,
                  onChanged: (value) {
                    setState(() {
                      _leaderValue = value!;
                    });
                  }),
              RadioListTile(
                  title: const Text('Project Team Member'),
                  value: 0.0,
                  groupValue: _leaderValue,
                  onChanged: (value) {
                    setState(() {
                      _leaderValue = value!;
                    });
                  }),
              ListTile(
                title: const Text('Additional Point'),
                trailing: DropdownButton(
                  value: _additionalValue,
                  items: List.generate(
                      10,
                      (index) => DropdownMenuItem(
                          value: index, child: Text('$index points'))),
                  onChanged: (value) {
                    setState(() {
                      _additionalValue = value!;
                    });
                  },
                ),
              ),
              CheckboxListTile(
                  title: const Text('Absence less than 4'),
                  value: _attendance,
                  onChanged: (value) {
                    setState(() {
                      _attendance = value!;
                    });
                  }),
              Text(_grade,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_attendance) {
                        var midTermExam = double.parse(_midController.text.trim());
                        var finalExam = double.parse(_finalController.text.trim());
                        double point = midTermExam + finalExam + _leaderValue + _additionalValue.toDouble();
                        if (point >= 170) {
                          _grade = 'A';
                        } else if (point >= 150) {
                          _grade = 'B';
                        } else if (point >= 130) {
                          _grade = 'C';
                        } else if (point >= 110) {
                          _grade = 'D';
                        } else {
                          _grade = 'F';
                        }
                      } else {
                        _grade = 'F';
                      }
                    });
                  },
                  child: const Text('Enter'))
            ],
          ),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
