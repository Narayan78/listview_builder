// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: listview(),
    );
  }
}

class listview extends StatefulWidget {
  const listview({Key? key}) : super(key: key);

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {
  int i = 0;
  final personName = TextEditingController();
  final personNumber = TextEditingController();
  int count = 0;
  List namelist = [];
  List phonelist = [];

  @override
  void dispose() {
    personName.dispose();
    personNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: (Color.fromARGB(0, 0, 0, 0)),
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: (Color.fromARGB(0, 0, 0, 0)),
          title: const Text(
            'Contact ',
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Stack(
                            //  overflow: Overflow.visible,
                            children: <Widget>[
                              Positioned(
                                right: -6.0,
                                top: 0.0,
                                child: InkResponse(
                                  onTap: () {
                                     print(namelist);
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                              Form(
                                // key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: personName,
                                        decoration:
                                            InputDecoration(hintText: 'Name :'),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                          controller: personNumber,
                                          decoration: InputDecoration(
                                              hintText: 'Phone Number')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        child: Text("Add"),
                                        onPressed: () {
                                          setState(() {
                                            namelist.add(personName.text);
                                            phonelist.add(personNumber.text);

                                            count = count + 1;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );

                        print(count);
                      });
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      CircleAvatar(radius: 35),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Narayan Kandel',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 25),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  physics: ScrollPhysics(parent: null),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      //  decoration:
                      // BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          tileColor: Color.fromARGB(235, 227, 222, 222),
                          title: Text(
                            namelist[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 22),
                          ),
                          subtitle: Text(
                            phonelist[index],
                            style: TextStyle(fontSize: 17),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (count > 0) {
                                    count = count - 1;
                                    namelist.removeAt(index);
                                  phonelist.removeAt(index);
                                  }
                                });
                              },
                              icon: const Icon(Icons.delete)),
                        ),
                      ),
                    );
                  },
                  itemCount: count,
                ),
              ],
            ),
          ],
        ));
  }
}
