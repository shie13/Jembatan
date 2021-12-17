//list output
import 'package:flutter/material.dart';
import 'package:flutter_app2/Input/InputAwal.dart';
import 'package:flutter_app2/Input/InputBeban.dart';
import 'package:flutter_app2/Input/InputDiameter.dart';
import 'package:flutter_app2/Pages/Help.dart';
import 'package:flutter_app2/UI/DED.dart';
import 'package:flutter_app2/UI/Girdia.dart';
import 'package:flutter_app2/UI/Pembebanan.dart';
import 'package:flutter_app2/UI/Slab.dart';
import 'package:flutter_app2/UI/Trotoar.dart';
import 'package:flutter_app2/db/db_task.dart';
import 'package:flutter_app2/model/project_model.dart';
import 'package:flutter_app2/model/task_model.dart';
//import 'Help.dart';

class Home extends StatefulWidget {
  final Task task;
  final Project project;
  Home({this.task, this.project});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    numtabel = widget.project.id;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.task.title),
          backgroundColor: Colors.red[600],
        ),
        drawer: Sidebar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InputPage(
                          project: widget.project, task: widget.task)),
                );
              },
              child: new Card(
                child: new Column(
                  children: <Widget>[
                    new Icon(
                      Icons.list_alt_rounded,
                      size: 35.0,
                      color: Colors.red,
                    ),
                    new Text(
                      "Input Data",
                      style: new TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Pembebanann(
                          project: widget.project, task: widget.task)),
                );
              },
              child: new Card(
                child: new Column(
                  children: <Widget>[
                    new Icon(
                      Icons.car_repair,
                      size: 35.0,
                      color: Colors.red,
                    ),
                    new Text(
                      "Analisis Pembebanan",
                      style: new TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Desaingirdia(
                          project: widget.project, task: widget.task)),
                );
              },
              child: new Card(
                child: new Column(
                  children: <Widget>[
                    new Icon(
                      Icons.format_strikethrough_rounded,
                      size: 35.0,
                      color: Colors.red,
                    ),
                    new Text(
                      "Desain Balok Girder dan Diafragma",
                      style: new TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Desainslab(
                          project: widget.project, task: widget.task)),
                );
              },
              child: new Card(
                child: new Column(
                  children: <Widget>[
                    new Icon(
                      Icons.edit_road_rounded,
                      size: 35.0,
                      color: Colors.red,
                    ),
                    new Text(
                      "Desain Slab Jembatan",
                      style: new TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Desaintro(
                          project: widget.project, task: widget.task)),
                );
              },
              child: new Card(
                child: new Column(
                  children: <Widget>[
                    new Icon(
                      Icons.transfer_within_a_station_rounded,
                      size: 35.0,
                      color: Colors.red,
                    ),
                    new Text(
                      "Analisis Slab Trotoar dan Railing",
                      style: new TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Ded(project: widget.project, task: widget.task)),
                );
              },
              child: new Card(
                child: new Column(
                  children: <Widget>[
                    new Icon(
                      Icons.crop_original_rounded,
                      size: 35.0,
                      color: Colors.red,
                    ),
                    new Text(
                      "Detail Gambar",
                      style: new TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  final Task task;
  final Project project;
  InputPage({this.task, this.project});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.task.title),
          backgroundColor: Colors.red[600],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Input1(
                                project: widget.project, task: widget.task)),
                      );
                    },
                    child: Text('Input Dimensi Jembatan')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Input2(
                                project: widget.project, task: widget.task)),
                      );
                    },
                    child: Text('Input Pembebanan')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Input3(
                                project: widget.project, task: widget.task)),
                      );
                    },
                    child: Text('Input Dimensi Material')),
              ],
            ),
          ),
        ));
  }
}
