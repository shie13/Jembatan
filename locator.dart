import 'package:flutter_app2/Provider/Diafragma_Pvd.dart';
import 'package:flutter_app2/Provider/Girder_Pvd.dart';
import 'package:flutter_app2/Provider/PembebananProvider.dart';
import 'package:flutter_app2/Provider/Slab_Pvd.dart';
import 'package:flutter_app2/Provider/Database.dart';
import 'package:flutter_app2/Provider/Trotoar_Pvd.dart';
import 'package:flutter_app2/Provider/cobapv.dart';
import 'package:get_it/get_it.dart';
// import 'package:flutter_app2/db/db_project.dart';
// import 'package:flutter_app2/db/db_task.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => RumusPembebanan());
  locator.registerLazySingleton(() => Girder());
  locator.registerLazySingleton(() => Trotoar());
  locator.registerLazySingleton(() => Cobapv());
  locator.registerLazySingleton(() => Slab());
  locator.registerLazySingleton(() => Diafragma());
  locator.registerLazySingleton(() => DbProvider());
  // locator.registerLazySingleton(() => ProjectH());
  // locator.registerLazySingleton(() => DatabaseTask());
}

