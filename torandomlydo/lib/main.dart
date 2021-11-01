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

  _addNote(String nota) {
    setState(() {
      _cards.add(nota);
    });
    Navigator.pop(context);
  }

  _newNote() {

    final myController = TextEditingController();

    @override
    void dispose() {
      myController.dispose();
     super.dispose();
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add note"),
          content: TextFormField(
            controller: myController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your note',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(onPressed: () => _addNote(myController.text), child: const Text('Accept')),
          ],
          actionsPadding: const EdgeInsets.symmetric(horizontal: 18.0),
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                itemCount: _cards.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    height: 80,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        trailing: Icon(Icons.add_to_drive_sharp),
                        title: Text(_cards[index], maxLines: 3, style: TextStyle(color: Colors.black.withOpacity(0.6)))
                      ),
                    )
                  );
                }),
              ),
            ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: _newNote,
        tooltip: 'Add note',
        child: const Icon(Icons.add),
      ),
    );
  }
}