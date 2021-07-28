import 'package:flutter/material.dart';

import 'form_screen.dart';

class SecondPage extends StatefulWidget {
  final FormScreenState value;

  const SecondPage({Key key, this.value}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIO-DATA'),
      ),
      body: Container(
        child: Center(
          child: Column(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
                child: Text(
                  'Register Successfully!!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 15.0),
                )),
            Padding(
                padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
                child: DataTable(
                  columns: [
                    DataColumn(
                        label: Text(
                      'NAME:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 14.0),
                    )),
                    DataColumn(label: Text('${widget.value.name}')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text(
                        'EMAIL:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 14.0),
                      )),
                      DataCell(Text('${widget.value.email}'))
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        'PHONENUMBER:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 14.0),
                      )),
                      DataCell(Text('${widget.value.phoneNumber}')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        'ADDRESS:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 14.0),
                      )),
                      DataCell(Text('${widget.value.address}')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        'AGE:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 14.0),
                      )),
                      DataCell(Text('${widget.value.age}')),
                    ]),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
