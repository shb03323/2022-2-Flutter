import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qatar World Cup 2022',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Qatar World Cup 2022'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;
  int _counter4 = 0;
  int _counter5 = 0;
  int _counter6 = 0;
  int _totalCount = 0;

  void _incrementCounter(int num) {
    setState(() {
      switch(num) {
        case 1:
          _counter1++;
          _totalCount = _counter1 + _counter3 + _counter5;
          break;
        case 2:
          _counter2++;
          break;
        case 3:
          _counter3++;
          _totalCount = _counter1 + _counter3 + _counter5;
          break;
        case 4:
          _counter4++;
          break;
        case 5:
          _counter5++;
          _totalCount = _counter1 + _counter3 + _counter5;
          break;
        case 6:
          _counter6++;
          break;
        default:
          break;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter1 = 0;
      _counter2 = 0;
      _counter3 = 0;
      _counter4 = 0;
      _counter5 = 0;
      _counter6 = 0;
      _totalCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => _incrementCounter(1),
                      child: const Text('Goal')
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Image.asset(
                      'lib/images/korea.png',
                      width: 50.0,
                    ),
                  ),
                  Text(
                    '${_counter1} : ${_counter2}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Image.asset(
                      'lib/images/uruguay.png',
                      width: 50.0,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => _incrementCounter(2),
                      child: const Text('Goal'),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => _incrementCounter(3),
                      child: const Text('Goal')
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Image.asset(
                      'lib/images/korea.png',
                      width: 50.0,
                    ),
                  ),
                  Text(
                    '${_counter3} : ${_counter4}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Image.asset(
                      'lib/images/ghana.png',
                      width: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _incrementCounter(4),
                    child: const Text('Goal'),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => _incrementCounter(5),
                      child: const Text('Goal')
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Image.asset(
                      'lib/images/korea.png',
                      width: 50.0,
                    ),
                  ),
                  Text(
                    '${_counter5} : ${_counter6}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Image.asset(
                      'lib/images/portugal.png',
                      width: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _incrementCounter(6),
                    child: const Text('Goal'),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                'Total Korean Goals:',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Text(
              '$_totalCount',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
