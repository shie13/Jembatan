import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/UI/SidebarPrj.dart';
import 'package:flutter_app2/model/project_model.dart';
import 'package:flutter_app2/model/task_model.dart';
// import 'package:flutter_app2/rumus/hitung.dart';
// import 'package:flutter_app2/rumus/hitungDia.dart';
import 'package:flutter_app2/rumus/hitungGirder.dart';
import 'package:flutter_app2/variabel.dart';

class Desaingirdia extends StatefulWidget {
  final Task task;
  final Project project;
  Desaingirdia({this.task, this.project});

  @override
  _DesaingirdiaState createState() => _DesaingirdiaState();
}
class _DesaingirdiaState extends State<Desaingirdia> {
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
      td = widget.task.td; 
      dtul = widget.task.dtul;
      ds = widget.task.ds; 
      dsh = widget.task.dsh; 
      djpt = widget.task.djpt;
      dtuldia = widget.task.dtuldia; 
      dsdia = widget.task.dsdia; 
      // dtuls = widget.task.dtuls;
      // dbs = widget.task.dbs; 
      // djts = widget.task.djts; 
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
      // hitungBeban();
      hitungGirder();
      // hitungDia();
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
            title: Text("Girder dan Diafragma"),
            backgroundColor: Colors.red[600],
            bottom: new TabBar(
              tabs: <Widget>[
                new Tab(text: "Girder"),
                new Tab(text: "Lendutan"),
                new Tab(text: "Diafragma"),
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
                            Text("TULANGAN LENTUR GIRDER", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text(rmax.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Momen ultimit (Mu)")),
                                      DataCell(Text(mu.toStringAsFixed(2) + " kNm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Mn")),
                                      DataCell(Text(deff.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Rn")),
                                      DataCell(Text(rn.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("")),
                                      DataCell(rn <= rmax ? Text("OK", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("Rn > Rmax", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Rasio tulangan perlu (ρ)")),
                                      DataCell(Text(rho.toStringAsFixed(4))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Luas tulangan dibutuhkan")),
                                      DataCell(Text(asperlu.toStringAsFixed(2) + " mm2")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text(nguna.toString() + " D - ${dtul.round()}")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Jumlah perbaris")),
                                      DataCell(Text(ntmax.toString())),]),
                                    DataRow(cells: [
                                      DataCell(Text("Luas Tulangan tekan (As')")),
                                      DataCell(Text(asc.toStringAsFixed(2) + " mm2")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text(nc.toString() + " D - ${dtul.round()}")),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("TULANGAN GESER GIRDER", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text("Gaya geser ultimit (Vu)")),
                                      DataCell(Text(vu.toStringAsFixed(2) + " kN")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Kuat geser nominal (ϕVc)")),
                                      DataCell(Text(avc.toStringAsFixed(2) + " kN")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Luas tulangan geser (Av)")),
                                      DataCell(Text(av.toStringAsFixed(2) + " mm2")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Jarak tulangan geser (S)")),
                                      DataCell(Text(sgkg.toStringAsFixed(2) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text("D ${ds.round()} - " + sgkgp.toString())),]),
                                    DataRow(cells: [
                                      DataCell(Text("Luas tulangan susut (Ash)")),
                                      DataCell(Text(ash.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text(nsh.toString() + " D - ${dsh.round()}")),]), //?
                                  ]
                              ),
                            ),
                          ]
                      ),
                    ),
                  ]
              ),
              //Lendutan
              ListView(
                  children: <Widget> [
                    Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                            children:<Widget> [
                              Text("Momen Inersia Efektif (Ic) = " + ic.toStringAsFixed(4) + " m4"),
                              new Padding(padding: new EdgeInsets.only(top: 10.0)),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                    columns: <DataColumn>[
                                      DataColumn(label: Text("Jenis Beban")),
                                      DataColumn(label: Text("Lendutan")),
                                    ],
                                    rows: <DataRow>[
                                      DataRow(cells: [
                                        DataCell(Text("Beban Sendiri (MS)")),
                                        DataCell(Text(lms.toStringAsFixed(4) + " m")),]),
                                      DataRow(cells: [
                                        DataCell(Text("Beban Mati Tambah (MA)")),
                                        DataCell(Text(lma.toStringAsFixed(4) + " m")),]),
                                      DataRow(cells: [
                                        DataCell(Text("Beban Lajur (TD)")),
                                        DataCell(Text(ltd.toStringAsFixed(4) + " m")),]),
                                      DataRow(cells: [
                                        DataCell(Text("Beban Pejalan Kaki (TP)")),
                                        DataCell(Text(ltp.toStringAsFixed(4) + " m")),]),
                                      DataRow(cells: [
                                        DataCell(Text("Beban Rem (TB)")),
                                        DataCell(Text(ltb.toStringAsFixed(4) + " m")),]),
                                      DataRow(cells: [
                                        DataCell(Text("Beban Temperatur (ET)")),
                                        DataCell(Text(let.toStringAsFixed(4) + " m")),]),
                                      DataRow(cells: [
                                        DataCell(Text("Beban Angin Str (EWs)")),
                                        DataCell(Text(lews.toStringAsFixed(4) + " m")),]),
                                      DataRow(cells: [
                                        DataCell(Text("Beban Angin Kend (EWl)")),
                                        DataCell(Text(lewl.toStringAsFixed(4) + " m")),]),
                                      DataRow(cells: [
                                        DataCell(Text("Beban Gempa (EQ)")),
                                        DataCell(Text(leq.toStringAsFixed(4) + " m")),]),
                                    ]
                                ),
                              ),
                              new Padding(padding: new EdgeInsets.only(top: 20.0)),
                              Text("Lendutan maksimum = " + lmax.toStringAsFixed(4) + " m"),
                              new Padding(padding: new EdgeInsets.only(top: 10.0)),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                      columns: <DataColumn>[
                                        DataColumn(label: Text("Kombinasi")),
                                        DataColumn(label: Text("Lendutan")),
                                        DataColumn(label: Text("CEK")),
                                      ],
                                      rows: <DataRow>[
                                        DataRow(cells: [
                                          DataCell(Text("Kuat I")),
                                          DataCell(Text(lk1.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            lk1 < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                        DataRow(cells: [
                                          DataCell(Text("Kuat II")),
                                          DataCell(Text(lk2.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            lk2 < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                        DataRow(cells: [
                                          DataCell(Text("Kuat III")),
                                          DataCell(Text(lk3.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            lk3 < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                        DataRow(cells: [
                                          DataCell(Text("Kuat IV")),
                                          DataCell(Text(lk4.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            lk4 < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                        DataRow(cells: [
                                          DataCell(Text("Kuat V")),
                                          DataCell(Text(lk5.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            lk5 < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                        DataRow(cells: [
                                          DataCell(Text("Ekstrem I")),
                                          DataCell(Text(le1.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            le1 < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                        DataRow(cells: [
                                          DataCell(Text("Ekstrem II")),
                                          DataCell(Text(le2.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            le2 < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                        DataRow(cells: [
                                          DataCell(Text("Daya Layan I")),
                                          DataCell(Text(ll1.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            ll1 < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                        DataRow(cells: [
                                          DataCell(Text("Daya Layan II")),
                                          DataCell(Text(ll2.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            ll2 < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                        DataRow(cells: [
                                          DataCell(Text("Daya Layan III")),
                                          DataCell(Text(ll3.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            ll3 < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                        DataRow(cells: [
                                          DataCell(Text("Daya Layan IV")),
                                          DataCell(Text(ll4.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            ll4 < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                        DataRow(cells: [
                                          DataCell(Text("Fatik")),
                                          DataCell(Text(lf.toStringAsFixed(4) + " m")),
                                          DataCell(
                                            lf < lmax ? Text("AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("TIDAK AMAN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
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
                            Text("PEMBEBANAN DIAFRAGMA", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Gaya Geser Ultimit (kombinasi), Vu = "+ vudia.toStringAsFixed(2) + " kN", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 10.0)),
                            Text("Momen Ultimit (kombinasi), Mu = "+ mudia.toStringAsFixed(2) + " kkNm", style: TextStyle(fontWeight: FontWeight.bold)),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("TULANGAN LENTUR DIAFRAGMA", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text(rmaxdia.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Rn")),
                                      DataCell(Text(rndia.toStringAsFixed(2))),]),
                                    DataRow(cells: [
                                      DataCell(Text("")),
                                      DataCell(rndia <= rmaxdia ? Text("OK", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)) : Text("Rn > Rmax", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Rasio tulangan perlu (ρ)")),
                                      DataCell(Text(rhodia.toStringAsFixed(4))),]),
                                    DataRow(cells: [
                                      DataCell(Text("Luas tulangan dibutuhkan")),
                                      DataCell(Text(asperlud.toStringAsFixed(2) + " mm2")),]),
                                    DataRow(cells: [
                                      DataCell(Text("")),
                                      DataCell(Text(ngunad.toString() + " D - " + (dtuldia.round()).toString())),]),
                                  ]
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.only(top: 20.0)),
                            Text("TULANGAN GESER DIAFRAGMA", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                                      DataCell(Text(avcd.toStringAsFixed(2) + " kN")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Luas tulangan geser(Av)")),
                                      DataCell(Text(avd.toStringAsFixed(2) + " mm2")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Jarak tulangan geser (S)")),
                                      DataCell(Text(sgkgd.toStringAsFixed(2) + " mm")),]),
                                    DataRow(cells: [
                                      DataCell(Text("Digunakan :")),
                                      DataCell(Text("D ${dsdia.round()} - $sgkgdp")),]),
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


