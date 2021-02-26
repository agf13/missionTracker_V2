import 'package:flutter/material.dart';
import 'package:mission_tracker_v2/screens/LoginScreen.dart';
import 'package:mission_tracker_v2/screens/MissionScreen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mission_tracker_v2/entities/Mission.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), "missionTracker.db"),
    onCreate:(db, version){
      db.execute(
          "CREATE TABLE Missions("
          "missionId INT PRIMARY KEY,"
          "title TEXT,"
          "importance TEXT,"
          //"deadline TEXT,"
          "details TEXT,"
          "additionalInformation TEXT)"
          //"dateAdded TEXT)"
      );
    },
    version: 1,
  );

  runApp(MyApp(
    database: database,
  ));
}

class MyApp extends StatefulWidget {
  final Future<Database> database;

  MyApp({this.database}){
    initDatabse();
  }

  Future<void> initDatabse() async{
    final Database db = await this.database;

    final numberMissions_rawResult = await db.rawQuery("SELECT COUNT(*) FROM Missions");
    int numberMissions = Sqflite.firstIntValue(numberMissions_rawResult);

    if(numberMissions == 0){
      Mission firstMission = Mission();
      firstMission.setId(1);
      firstMission.setAll(
        "First Mission",
        "-",
        "This is a mission for the purpose of existing in your screen",
        "No additional information here",
      );
      db.insert(
        "Missions",
        firstMission.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
      );

      print("mission added in init: " + firstMission.toString());
    }


  }

  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() =>_MyAppState();
}


class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mission Tracker",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LoginScreen(
        database: widget.database,
      ),
    );
  }
  
}

