import 'package:flutter/material.dart';

void main() => runApp(ListViewApp());

class ListViewApp extends StatefulWidget {
  @override
  _ListViewAppState createState() => _ListViewAppState();
}

class _ListViewAppState extends State<ListViewApp> {
  final List<String> entries = [];
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    entries.sort();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(
          title: TextField(
            controller: textController,
            decoration: InputDecoration(labelText: 'saisissez vos tâches,'),
          ), 
          leading: Icon( Icons.keyboard_alt, ),
        ),
        body: entries.isNotEmpty
            ? ListView.separated(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon( Icons.exit_to_app,),
                    title: Text(entries[index]),
                     onLongPress: () {
                      setState(() {
                        entries.removeAt(index);
                      });

                    },
                  );
                },
                  separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      color: Colors.black,
                    ),
              )
            : Center(
                 child: Text('Todo List.'),
              ), // Center
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
             setState(() {
              entries.add(textController.text);
               textController.clear();
            });
          },
        ), 
      ), 
    );
  }
}

