import 'package:flutter/material.dart';
import 'styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.lightYellow,
        ),
        primarySwatch: Colors.indigo,
        fontFamily: 'Cabin',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Flutter App'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.tag_faces), text: 'Students'),
            Tab(icon: Icon(Icons.photo), text: 'Album'),
            Tab(icon: Icon(Icons.info), text: 'Info'),
          ]),
        ),
        body: TabBarView(
          children: [
            Tab(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(100, (index) {
                  return ListTile(
                    leading: const Icon(Icons.home),
                    title: Text('Student ${index + 1}'),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: () {},
                  );
                }).toList(),
              ),
            ),
            Tab(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(16,
                        (i) => Image.asset('assets/images/dog_${i + 1}.jpeg'))
                    .toList(),
              ),
            ),
            Tab(
                child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Opacity(
                      opacity: 0.25,
                      child: Image.asset('assets/images/warning.jpeg'),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'This page does not include contents.',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Please insert contents by pressing this button.',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      )
                    ],
                  ),
                ),
              ],
            )),
          ],
        ),
        drawer: const Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
          ],
        ),
      ),
    );
  }
}
