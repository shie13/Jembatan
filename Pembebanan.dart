import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/UI/SidebarPrj.dart';
import 'package:flutter_app2/rumus/hitung.dart';
import 'package:flutter_app2/model/project_model.dart';
import 'package:flutter_app2/model/task_model.dart';


import '../variabel.dart';

class Pembebanann extends StatefulWidget {
  final Task task;
  final Project project;
  Pembebanann({this.task, this.project});

  @override
  _PembebanannState createState() => _PembebanannState();
}

class _PembebanannState extends State<Pembebanann> {
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
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      masukData();
      hitungBeban();
    });
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Sidebar1(project: widget.project, task: widget.task),
          appBar: AppBar(
            title: Text("Pembebanan"),
            backgroundColor: Colors.red[600],
            bottom: new TabBar(
              tabs: <Widget>[
                new Tab(text: "Jenis Pembebanan"),
                new Tab(text: "Kombinasi Beban"),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              new ListView(
                  children:<Widget> [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                          children:<Widget> [
                            Text("BERAT SENDIRI (MS)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Beban Sendiri, Q MS = " + qms.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Gaya Geser, V MS = " + vms.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen, M MS = " + mms.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),

                            Text("BEBAN MATI TAMBAHAN (MA)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Beban Mati Tambahan, Q MA = " + qma.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Gaya Geser, V MA = " + vma.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen, M MA = " + mma.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),

                            Text("BEBAN LALU LINTAS (TD/TT)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(label: Text("Beban Lajur (TD)")),
                                    DataColumn(label: Text("")),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: [
                                      DataCell(Text("Beban Lajur Merata (QTD)")),
                                      DataCell(Text(qtd.toStringAsFixed(2) + " kN/m")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Beban Lajur Tepusat (PTD)")),
                                      DataCell(Text(ptd.toStringAsFixed(2) + " kN")),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Gaya Geser Lajur, VD = " + vtd1.toStringAsFixed(2) + " kN"),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen Lajur, MD = " + mtd1.toStringAsFixed(2) + " kNm"),
                            new Padding(padding: new EdgeInsets.only(top: 15.0)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(label: Text("Beban Truk (TT)")),
                                    DataColumn(label: Text("")),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: [
                                      DataCell(Text("Beban Truk (PTT)")),
                                      DataCell(Text("500 kN")),]), //beban?
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Gaya Geser truk, V TT = " + vtt.toStringAsFixed(2) + " kN"),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen truk, M TT = " + mtt.toStringAsFixed(2) + " kNm"),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Gaya Geser, V TD = " + vtd.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen, M TD = " + mtd.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("BEBAN PEJALAN KAKI (TP)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text("Beban (Q TP)")),
                                      DataCell(Text(qtp.toStringAsFixed(2) + " kN" )),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Gaya Geser, V TP = " + vtp.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen, M TP = " + mtp.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold)),

                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("BEBAN REM (TB)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text("Beban Rem (TTB)")),
                                      DataCell(Text(ttb.toStringAsFixed(2) + " kN")),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 15.0)),
                            Text("Gaya Geser, V TB = " + vtb.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen, M TB = " + mtb.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),

                            Text("BEBAN ANGIN STRUKTUR (EWs)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text("Beban Angin (QEWs)")),
                                      DataCell(Text(qews.toStringAsFixed(2) + " kN/m ", style: TextStyle(fontWeight: FontWeight.bold))),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Gaya Geser, V EWs " + vews.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen, M EWs " + mews.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            
                            Text("BEBAN ANGIN PADA KENDARAAN (EWl)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Beban angin, Q EWl = " + qewl.toStringAsFixed(2) + " kN/m"),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Gaya Geser, V EWl = " + vewl.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen, M EWl = " + mewl.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            
                            Text("BEBAN TEMPERATUR (ET)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text("Gaya akibat temperatur")),
                                      DataCell(Text(fet.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold))),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Gaya Geser, V ET = " + vet.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen, M ET = " + met.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("BEBAN GEMPA (EQ)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text("Beban Gempa (Q EQ)", style: TextStyle(fontWeight: FontWeight.bold))),
                                      DataCell(Text(qeq.toStringAsFixed(2) + " kN/m ", style: TextStyle(fontWeight: FontWeight.bold))),]),
                                  ]
                              ),
                            ),
                            Text("Gaya Geser, V EQ  " + veq.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen, M EQ  " + meq.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold)),
                          ]
                      ),
                    ),
                  ]
              ),
              //TAB KOMBINASI
              ListView(
                children: <Widget> [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                        children:<Widget> [
                          Text("KOMBINASI GAYA GESER ULTIMIT", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                          new Padding(padding: new EdgeInsets.only(top: 15.0)),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                                columns: <DataColumn>[
                                  DataColumn(label: Text("Kombinasi")),
                                  DataColumn(label: Text("V (kN)")),
                                ],
                                rows: <DataRow>[
                                  DataRow(cells: [
                                    DataCell(Text("Kuat I")),
                                    DataCell(Text(vk1.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Kuat II")),
                                    DataCell(Text(vk2.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Kuat III")),
                                    DataCell(Text(vk3.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Kuat IV")),
                                    DataCell(Text(vk4.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Kuat V")),
                                    DataCell(Text(vk5.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Ekstrem I")),
                                    DataCell(Text(ve1.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Ekstrem II")),
                                    DataCell(Text(ve2.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Daya Layan I")),
                                    DataCell(Text(vl1.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Daya Layan II")),
                                    DataCell(Text(vl2.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Daya Layan III")),
                                    DataCell(Text(vl3.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Daya Layan IV")),
                                    DataCell(Text(vl4.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Fatik")),
                                    DataCell(Text(vf.toStringAsFixed(2))),
                                  ]),
                                ]
                            ),
                          ),
                          new Padding(padding: new EdgeInsets.only(top: 20.0)),
                          Text("KOMBINASI MOMEN ULTIMIT", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                          new Padding(padding: new EdgeInsets.only(top: 15.0)),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                                columns: <DataColumn>[
                                  DataColumn(label: Text("Kombinasi")),
                                  DataColumn(label: Text("M (kNm)")),
                                ],
                                rows: <DataRow>[
                                  DataRow(cells: [
                                    DataCell(Text("Kuat I")),
                                    DataCell(Text(mk1.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Kuat II")),
                                    DataCell(Text(mk2.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Kuat III")),
                                    DataCell(Text(mk3.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Kuat IV")),
                                    DataCell(Text(mk4.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Kuat V")),
                                    DataCell(Text(mk5.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Ekstrem I")),
                                    DataCell(Text(me1.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Ekstrem II")),
                                    DataCell(Text(me2.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Daya Layan I")),
                                    DataCell(Text(ml1.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Daya Layan II")),
                                    DataCell(Text(ml2.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Daya Layan III")),
                                    DataCell(Text(ml3.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Daya Layan IV")),
                                    DataCell(Text(ml4.toStringAsFixed(2))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Fatik")),
                                    DataCell(Text(mf.toStringAsFixed(2))),
                                  ]),
                                ]
                            ),
                          ),
                          new Padding(padding: new EdgeInsets.only(top: 15.0)),
                          Text("Gaya Geser Ultimit, Vu = " + vu.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold)),
                          new Padding(padding: new EdgeInsets.only(top: 10.0)),
                          Text("Momen Ultimit, Mu = " + mu.toStringAsFixed(2) + " kNm", style: TextStyle(fontWeight: FontWeight.bold)),
                        ]
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

