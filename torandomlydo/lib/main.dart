import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Randomly Do',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'To Randomly Do'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _cards = ["Hola"];

  void _incrementCounter() {
    setState(() {
      _cards.add("Hola");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                itemCount: _cards.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 220,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: Text(_cards[index])             
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      )
    );
  }

Widget cryptoIcon(data) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          data[‘icon’],
          color: data[‘iconColor’],
          size: 40,
        )),
  );
 }
Widget cryptoNameSymbol(data) {
  return Align(
    alignment: Alignment.centerLeft,
    child: RichText(
      text: TextSpan(
        text: ‘${data[‘name’]}’,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: ‘\n${data[‘symbol’]}’,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
 }
Widget cryptoChange(data) {
  return Align(
    alignment: Alignment.topRight,
    child: RichText(
      text: TextSpan(
        text: ‘${data[‘change’]}’,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: ‘\n${data[‘changeValue’]}’,
              style: TextStyle(
                  color: data[‘changeColor’],
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
         ],
       ),
     ),
   );
 }
Widget changeIcon(data) {
  return Align(
      alignment: Alignment.topRight,
      child: data[‘change’].contains(‘-’)
          ? Icon(
        Typicons.arrow_sorted_down,
        color: data[‘changeColor’],
        size: 30,
      )
          : Icon(
        Typicons.arrow_sorted_up,
        color: data[‘changeColor’],
        size: 30,
      ));
 }
Widget cryptoAmount(data) {
  return Align(
  alignment: Alignment.centerLeft,
  child: Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Row(
      children: <Widget>[
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: ‘\n${data[‘value’]}’,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 35,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: ‘\n0.1349’,
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    ),
  ),
);
}
}