import 'package:finalproject/screens/new_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:finalproject/environments/environments.dart';

class UsersList extends StatefulWidget {
  const UsersList({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  var data = [];

  initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final extractedResult = await http.get(Uri.parse(Environments.GET_API_URL));
    var result = json.decode(extractedResult.body);
    print(result[0]['id']);

    setState(() {
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(
                top: widget.screenSize.height * 0.10,
                left: widget.screenSize.width / 15,
                right: widget.screenSize.width / 15,
                bottom: 0),
            child: const Text(
              'Users List',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF263b5e)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: widget.screenSize.width / 20,
            right: widget.screenSize.width / 20,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewUser()),
                  );
                },
                child: const Text('New User')),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: widget.screenSize.height * 0.03,
          ),
          child: SizedBox(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: widget.screenSize.width / 20,
                  right: widget.screenSize.width / 20,
                ),
                child: widget.screenSize.width > 800
                    ? Table(
                        columnWidths: {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(3),
                          2: FlexColumnWidth(6),
                          3: FlexColumnWidth(2),
                          4: FlexColumnWidth(2),
                        },
                        // defaultColumnWidth: IntrinsicColumnWidth(),
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2),
                        children: [
                          const TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('ID',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('NAME',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('EMAIL',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('GENDER',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('STATUS',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold))
                              ]),
                            )
                          ]),
                          for (int i = 0; i < data.length; i++)
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                    children: [Text(data[i]["id"].toString())]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(children: [
                                  Text(data[i]["name"].toString())
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(children: [
                                  Text(data[i]["email"].toString())
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(children: [
                                  Text(data[i]["gender"].toString())
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(children: [
                                  Text(data[i]["status"].toString())
                                ]),
                              ),
                            ]),
                        ],
                      )
                    : Table(
                        columnWidths: {0: FlexColumnWidth(2)},
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2),
                        children: [
                          const TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('ID',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                          ]),
                          for (int i = 0; i < data.length; i++)
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(children: [
                                  Text(data[i]["name"].toString())
                                ]),
                              ),
                            ]),
                        ],
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
