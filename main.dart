import 'package:flutter/material.dart';
import 'Input/addProject.dart';
import 'Pages/DesainSlab.dart';
import 'Pages/DesainTrotoar.dart';
import 'Pages/DesainGirdia.dart';
import 'Pages/HomePage.dart';
import 'Pages/PembebananTabel.dart';
import 'Pages/gambar.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: GetMaterialApp(
      initialRoute : '/',
      getPages: [
        GetPage(name: '/', page: () => ListProjectPage()),
        GetPage(name: '/Home', page: () => Home()),
        GetPage(name: '/Input', page: () => InputPage()),
        GetPage(name: '/Girdia', page: () => Desaingirdia()),
        GetPage(name: '/Pembebanan1', page: () => Pembebanann()),
        GetPage(name: '/Slab', page: () => Desainslab()),
        GetPage(name: '/Trotoar', page: () => Desaintro()),
        GetPage(name: '/Ded', page: () => Ded()),
      ],
      ),
    );     
}
}


  









