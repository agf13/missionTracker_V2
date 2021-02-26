

import 'package:mission_tracker_v2/entities/Mission.dart';
import 'package:sqflite/sqflite.dart';

class MissionRepository{
  Future<Database> database;

  MissionRepository({this.database});

  Future<void> addMission(Mission mission) async{
    final Database db = await this.database;

    await db.insert(
      'Missions',
      mission.toMap(),
      conflictAlgorithm:  ConflictAlgorithm.replace,
    );

    print("Add Mission Locally: " + mission.toString());
  }


}