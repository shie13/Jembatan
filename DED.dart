import 'package:flutter/material.dart';
import 'package:flutter_app2/UI/SidebarPrj.dart';
import 'package:flutter_app2/model/project_model.dart';
import 'package:flutter_app2/model/task_model.dart';
import 'package:flutter_app2/rumus/gambar.dart';
import 'package:flutter_app2/rumus/hitung.dart';
import 'package:flutter_app2/rumus/hitungDed.dart';
import 'package:flutter_app2/rumus/hitungGirder.dart';
import 'package:flutter_app2/rumus/hitungSlab.dart';
import 'package:flutter_app2/rumus/hitungTro.dart';
import 'package:flutter_app2/variabel.dart';

class Ded extends StatefulWidget {
  final Task task;
  final Project project;
  Ded({this.task, this.project});

  @override
  _DedState createState() => _DedState();
}

class _DedState extends State<Ded> {
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
      dtuls = widget.task.dtuls;
      dbs = widget.task.dbs; 
      djts = widget.task.djts; 
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
      hitungBeban();
      hitungGirder();
      hitungSlab();
      hitungTro();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar1(project: widget.project, task: widget.task),
      appBar: AppBar(
        title: Text("Detail Gambar"),
        backgroundColor: Colors.red[600],
      ),
      body:new ListView(
          children:<Widget> [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children:<Widget> [
                  Container(
                    color: Colors.grey,
                    child: CustomPaint(
                      size: Size(lcanvas,tcanvasg),
                      painter: DedGirder(),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 20.0)),
                  Container(
                    color: Colors.grey,
                    child: CustomPaint(
                      size: Size(lcanvas,tcanvasd),
                      painter: DedDiafragma(),
                      ),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 20.0)),
                  Container(
                    color: Colors.grey,
                    child: CustomPaint(
                      size: Size(lcanvas,tcanvass),
                      painter: DedSlab(),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 20.0)),
                  Container(
                    color: Colors.grey,
                    child: CustomPaint(
                      size: Size(lcanvas,tcanvastr),
                      painter: DedTrotoar(),
                    ),
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }
}

