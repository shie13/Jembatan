import 'package:flutter_app2/UI/SidebarPrj.dart';
import 'package:flutter_app2/model/project_model.dart';
import 'package:flutter_app2/model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/rumus/hitung.dart';
// import 'package:flutter_app2/rumus/hitungDia.dart';
// import 'package:flutter_app2/rumus/hitungGirder.dart';
import 'package:flutter_app2/rumus/hitungSlab.dart';

import '../variabel.dart';

class Desainslab extends StatefulWidget {
  final Task task;
  final Project project;
  Desainslab({this.task, this.project});
  
  @override
  _DesainslabState createState() => _DesainslabState();
}
class _DesainslabState extends State<Desainslab> {
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
      dtuls = widget.task.dtuls;
      dbs = widget.task.dbs; 
      djts = widget.task.djts; 
      // djtss = widget.task.djtss;
      // dtult = widget.task.dtult; 
      // dbt = widget.task.dbt; 
      // bdr = widget.task.bdr;
      // dtulr = widget.task.dtulr; 
      // dgr = widget.task.dgr;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      masukData();
      hitungBeban();
      // hitungGirder();
      // hitungDia();
      hitungSlab();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: Sidebar1(project: widget.project, task: widget.task),
          appBar: AppBar(
            title: Text("Perhitungan Slab Jembatan"),
            backgroundColor: Colors.red[600],
            bottom: new TabBar(
              tabs: <Widget>[
                new Tab(text: "Pembebanan"),
                new Tab(text: "Penulangan"),
                new Tab(text: "Kontrol"),
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
                            Text("MOMEN TIAP JENIS BEBAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(label: Text("Beban")),
                                    DataColumn(label: Text("M tumpuan")),
                                    DataColumn(label: Text("M lapangan")),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: [
                                      DataCell(Text("Sendiri")),
                                      DataCell(Text(msst.toStringAsFixed(2) + " kNm")),
                                      DataCell(Text(mssl.toStringAsFixed(2) + " kNm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Mati Tambahan")),
                                      DataCell(Text(mast.toStringAsFixed(2) + " kNm")),
                                      DataCell(Text(masl.toStringAsFixed(2) + " kNm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Truk")),
                                      DataCell(Text(ttst.toStringAsFixed(2) + " kNm")),
                                      DataCell(Text(ttsl.toStringAsFixed(2) + " kNm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Angin")),
                                      DataCell(Text(ewst.toStringAsFixed(2) + " kNm")),
                                      DataCell(Text(ewsl.toStringAsFixed(2) + " kNm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Temperatur")),
                                      DataCell(Text(etst.toStringAsFixed(2) + " kNm")),
                                      DataCell(Text(etsl.toStringAsFixed(2) + " kNm")),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("MOMEN ULTIMIT", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen Ultimit Tumpuan, Mut = " + mstu.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen Ultimit lapangan, Mul = " + mslu.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                          ]
                      ),
                    ),
                  ]
              ),
              //tulangan
              ListView(
                  children: <Widget> [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                          children:<Widget> [
                            Text("TULANGAN LENTUR NEGATIF", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text(rmaxs.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Rn")),
                                      DataCell(Text(rnst.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("")),
                                      DataCell(rnst <= rmaxs ? Text("OK", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("Rn > Rmax", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Luas tulangan dibutuhkan")),
                                      DataCell(Text(asperlust.toStringAsFixed(2) + " mm2")),]),
                                    DataRow(cells: [
                                      DataCell(Text("jarak antar tulangan (S)")),
                                      DataCell(Text(sstperlu.toStringAsFixed(2) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text("D ${dtuls.round()} - $sstpakai")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Tulangan Susut :")),
                                      DataCell(Text("")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Jarak antar tulangan (S)")),
                                      DataCell(Text(sbstperlu.toStringAsFixed(2) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text("D ${dbs.round()} - $sbstpakai")),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("TULANGAN LENTUR POSITIF", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text(rmaxs.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Rn")),
                                      DataCell(Text(rnsl.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("")),
                                      DataCell(rnsl <= rmaxs ? Text("OK", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("Rn > Rmax", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]), //?
                                    DataRow(cells: [
                                      DataCell(Text("Luas tulangan dibutuhkan")),
                                      DataCell(Text(asperlusl.toStringAsFixed(2) + " mm2")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Jarak antar tulangan (S)")),
                                      DataCell(Text(sslperlu.toStringAsFixed(2) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text("D ${dtuls.round()} - $sslpakai")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Tulangan Susut :")),
                                      DataCell(Text("")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Jarak antar tulangan (S)")),
                                      DataCell(Text(sbslperlu.toStringAsFixed(2) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text("D ${dbs.round()} - $sbslpakai")),]),
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
                            Text("KONTROL LENDUTAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text("Bentang Slab (Lx)")),
                                      DataCell(Text("$sg m")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Lendutan Max (δmax)")),
                                      DataCell(Text(lendmax.toStringAsFixed(4) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Lendutan Elastis akibat beban (δe)")),
                                      DataCell(Text(ls.toStringAsFixed(4) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Lendutan Jangka Panjang")),
                                      DataCell(Text(lg.toStringAsFixed(4) + " mm")),]),
                                      DataRow(cells: [
                                      DataCell(Text("Lendutan Total")),
                                      DataCell(Text(ltot.toStringAsFixed(4) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("CEK")),
                                      DataCell(ltot <= lendmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("KONTROL TEGANGAN PONS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text("Gaya Geser Pons Terfaktor (φPn)")),
                                      DataCell(Text(opns.toStringAsFixed(2) + " kN")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Gaya Geser Pons Ultimit (Pu)")),
                                      DataCell(Text(pus.toStringAsFixed(2) + " kN")),]),
                                    DataRow(cells: [
                                      DataCell(Text("CEK")),
                                      DataCell(pus < opns ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
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


