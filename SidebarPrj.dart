import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/Input/addProject.dart';
import 'package:flutter_app2/Pages/Help.dart';
import 'package:flutter_app2/Pages/HomePage.dart';
import 'package:flutter_app2/UI/Girdia.dart';
import 'package:flutter_app2/UI/Pembebanan.dart';
import 'package:flutter_app2/UI/Slab.dart';
import 'package:flutter_app2/UI/Trotoar.dart';
import 'package:flutter_app2/model/project_model.dart';
import 'package:flutter_app2/model/task_model.dart';

class Sidebar1 extends StatefulWidget{
  final Task task;
  final Project project;
  Sidebar1({this.task, this.project});

  @override
  _Sidebar1State createState() => _Sidebar1State();
}

class _Sidebar1State extends State<Sidebar1> {
  @override
  void initState() {
    super.initState();
    // numtabel = widget.project.id;
  }

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text ('CEMApp T-Girder'),
            accountEmail: Text ('Civil Engineering Mobile Application'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/Logo1.PNG', fit: BoxFit.cover),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xFFE53935), Color(0xFFDE4845), Color(0xFFD06766), Color(0xFFD3A6A5),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InputPage(
                          project: widget.project, task: widget.task)),
                );
            },
            leading: Icon(Icons.list_alt_rounded, size: 20),
            title: Text("Edit Input Data"),
          ),
          ListTile(
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Pembebanann(
                          project: widget.project, task: widget.task)),
                );
            },
            leading: Icon(Icons.car_repair, size: 20),
            title: Text("Analisis Pembebanan"),
          ),
          ListTile(
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Desaingirdia(
                          project: widget.project, task: widget.task)),
                );
            },
            leading: Icon(Icons.format_strikethrough_rounded, size: 20),
            title: Text("Girder dan Diafragma"),
          ),
          ListTile(
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Desainslab(
                          project: widget.project, task: widget.task)),
                );
            },
            leading: Icon(Icons.edit_road_rounded, size: 20),
            title: Text("Slab Jembatan"),
          ),
          ListTile(
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Desaintro(
                          project: widget.project, task: widget.task)),
                );
            },
            leading: Icon(Icons.transfer_within_a_station_rounded, size: 20),
            title: Text("Slab Trotoar dan Railing"),
          ),
          Divider(color: Colors.black12),
          ListTile(
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListProjectPage()),
                );
            },
            leading: Icon(Icons.folder_open_rounded, size: 25),
            title: Text("Open Other Project"),
          ),
          ListTile(
            onTap: () {
              showDialog(context: context, builder:(context) => Help1());
            },
            leading: Icon(Icons.help_rounded, size: 20),
            title: Text("Help"),
          ),
          ListTile(
            onTap: () {
              showDialog(context: context, builder:(context) => Aboutpage(
                title: "About this App",
                description: "CEMApp T-Girder is  an android application for top structural analysis and design of T-Girder bridge.",
                author: 'Made by Ashiela Haruni Sagita Putri',
                version: 'Version 1.0.0',
                year: '2021',
              ),
              );
            },
            leading: Icon(Icons.info_rounded, size: 20),
            title: Text("About"),
          ),
          ListTile(
            onTap: () {
              SystemNavigator.pop();
              //exit(0);
            },
            leading: Icon(Icons.close_rounded, size: 20),
            title: Text("Exit"),
          ),
        ],
      ),
    );
  }
}