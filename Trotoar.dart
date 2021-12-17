import 'package:flutter_app2/UI/SidebarPrj.dart';
import 'package:flutter_app2/model/project_model.dart';
import 'package:flutter_app2/model/task_model.dart';
import 'package:flutter_app2/rumus/hitungTro.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/variabel.dart';

class Desaintro extends StatefulWidget {
  final Task task;
  final Project project;
  Desaintro({this.task, this.project});
  
  @override
  _DesaintroState createState() => _DesaintroState();
}

class _DesaintroState extends State<Desaintro> {
    void masukData(){
      l = widget.task.l;
      b1 = widget.task.b1;
      b2 = widget.task.b2; 
      b = widget.task.b;
      h = widget.task.h; 
      bd = widget.task.bd; 
      hd = widget.task.hd;
      nd = widget.task.nd; 
      r = widget.task.r; 
      ts = widget.task.ts;
      ta = widget.task.ta; 
      th = widget.task.th; 
      lr = widget.task.lr; 
      sg = widget.task.sg;
      k = widget.task.k; 
      v = widget.task.v; 
      wc = widget.task.wc;
      wa = widget.task.wa; 
      ul = widget.task.ul; 
      uks =widget.task.uks;
      bt = widget.task.bt;
      vb = widget.task.vb;
      v10 = widget.task.v10;
      pga = widget.task.pga;
      sa = widget.task.sa;
      s1 = widget.task.s1;
      fpga = widget.task.fpga;
      fa = widget.task.fa;
      fv = widget.task.fv;
      rd = widget.task.rd;
      // td = widget.task.td; 
      // dtul = widget.task.dtul;
      // ds = widget.task.ds; 
      // dsh = widget.task.dsh; 
      // djpt = widget.task.djpt;
      // dtuldia = widget.task.dtuldia; 
      // dsdia = widget.task.dsdia; 
      // dtuls = widget.task.dtuls;
      // dbs = widget.task.dbs; 
      // djts = widget.task.djts; 
      djtss = widget.task.djtss;
      dtult = widget.task.dtult; 
      dbt = widget.task.dbt; 
      bdr = widget.task.bdr;
      dtulr = widget.task.dtulr; 
      dgr = widget.task.dgr;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      masukData();
      hitungTro();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Sidebar1(project: widget.project, task: widget.task),
          appBar: AppBar(
            title: Text("Trotoar dan Railing"),
            backgroundColor: Colors.red[600],
            bottom: new TabBar(
              tabs: <Widget>[
                new Tab(text: "Slab Trotoar"),
                new Tab(text: "Railing"),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                  children: <Widget> [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                          children:<Widget> [
                            Text("PEMBEBANAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(label: Text("Data")),
                                    DataColumn(label: Text("Besaran")),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: [
                                      DataCell(Text("Momen akibat Berat Sendiri")),
                                      DataCell(Text(mst.toStringAsFixed(2) + " kNm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Momen akibat Beban Hidup")),
                                      DataCell(Text(mat.toStringAsFixed(2) + " kNm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Momen Ultimit Rencana")),
                                      DataCell(Text(mut.toStringAsFixed(2) + " kNm")),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("PENULANGAN TROTOAR", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(label: Text("Data")),
                                    DataColumn(label: Text("Besaran")),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: [
                                      DataCell(Text("Rmax")),
                                      DataCell(Text(rmaxt.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Rn")),
                                      DataCell(Text(rnt.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("")),
                                      DataCell(rnt <= rmaxt ? Text("OK", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("Rn > Rmax", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Rasio tulangan perlu")),
                                      DataCell(Text(rhot.toStringAsFixed(4))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Luas Tulangan dibutuhkan")),
                                      DataCell(Text(ast.toStringAsFixed(2) + " mm2")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Jarak antar tulangan (S)")),
                                      DataCell(Text(st.toStringAsFixed(2) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text("D${dtult.round()} - $stp")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Tulangan Susut :")),
                                      DataCell(Text("")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Jarak antar tulangan (S)")),
                                      DataCell(Text(sb.toStringAsFixed(2) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text("D${dbt.round()} - $sbp")),]),
                                  ]
                              ),
                            ),
                          ]
                      ),
                    ),
                  ]
              ),
              ListView(
                  children: <Widget> [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                          children:<Widget> [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(label: Text("PEMBEBANAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent))),
                                    DataColumn(label: Text("")),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: [
                                      DataCell(Text("Gaya Geser Ultimit (Vu)")),
                                      DataCell(Text(vur.toStringAsFixed(2) + " kN")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Momen Ultimit (Mu)")),
                                      DataCell(Text(mur.toStringAsFixed(2) + " kNm")),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("TULANGAN LENTUR TIANG RAILING", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(label: Text("Data")),
                                    DataColumn(label: Text("Besaran")),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: [
                                      DataCell(Text("Jarak pusat tulangan (d')")),
                                      DataCell(Text("$djtss mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Rmax")),
                                      DataCell(Text(rmaxr.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Rn")),
                                      DataCell(Text(rnr.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("")),
                                      DataCell(rnr <= rmaxr ? Text("OK", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("Rn > Rmax", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Rasio tulangan perlu")),
                                      DataCell(Text(rhor.toStringAsFixed(4))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Luas tulangan diperlukan")),
                                      DataCell(Text(asr.toStringAsFixed(2) + " mm2")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan")),
                                      DataCell(Text("$nr  D - ${dtulr.round()}")),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("TULANGAN GESER TIANG RAILING", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(label: Text("Data")),
                                    DataColumn(label: Text("Besaran")),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: [
                                      DataCell(Text("Kuat geser nominal(ϕVc)")),
                                      DataCell(Text(avcr.toStringAsFixed(2) + " kN")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Luas tulangan geser (Av)")),
                                      DataCell(Text(avr.toStringAsFixed(2) + " mm2")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Jarak tulangan maksimal(S)")),
                                      DataCell(Text(sqr.toStringAsFixed(2) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text("D ${dgr.round()} - $sgr")),]),
                                  ]
                              ),
                            ),
                          ]
                      ),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}


