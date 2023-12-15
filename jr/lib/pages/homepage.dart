import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: 500,
          minWidth: 500,
          // minimum width

          maxHeight: MediaQuery.of(context).size.height,
          //maximum height set to 100% of vertical height

          maxWidth: MediaQuery.of(context).size.width,
          //maximum width set to 100% of width
        ),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'booking');
          },
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 16, 20, 23),
                borderRadius: BorderRadius.circular(7)),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
            ),
            width: 220,
            height: 50,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.directions_bus_rounded,
                  size: 48.0, // Adjust the size of the icon as needed
                  color: Colors.blue, // Adjust the color of the icon as needed
                ),
                Text(
                  key: Key('booking_screen'),
                  'Book a trip Now',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
