import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

final databaseServiceProvider = Provider<DatabaseService>((ref) => DatabaseService());

class DatabaseService {
  Database? _database;

  Database? get db => _database;

  Future<void> init() async {
    if (_database != null) return;

    _database = await openDatabase(
      path.join(await getDatabasesPath(), 'sima.db'),
      version: 1,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (Database db, int version) async {
        var batch = db.batch();

        batch.execute(
            "CREATE TABLE past_cycles(id INTEGER PRIMARY KEY AUTOINCREMENT, workouts TEXT NOT NULL, start_date_mse INTEGER NOT NULL)");
        batch.execute(
            "CREATE TABLE workouts(id INTEGER PRIMARY KEY AUTOINCREMENT, type TEXT NOT NULL, name TEXT NOT NULL, force_completed INTEGER DEFAULT 0)");
        batch.execute(
            "CREATE TABLE exercises(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, description TEXT NOT NULL, type INTEGER DEFAULT 0, max INTEGER DEFAULT 10, video_path TEXT DEFAULT NULL, sets TEXT DEFAULT '{}', logs TEXT DEFAULT '[]')");
        batch.execute(
            "CREATE TABLE exercises_in_workout(exercise_id INTEGER NOT NULL, workout_id INTEGER NOT NULL, force_completed INTEGER DEFAULT 0, PRIMARY KEY (exercise_id, workout_id), FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE, FOREIGN KEY (workout_id) REFERENCES workouts(id) ON DELETE CASCADE)");
        await batch.commit();
      },
    );
  }

  Future<void> deleteSimaDatabase() async {
    final dbPath = path.join(await getDatabasesPath(), 'sima.db');
    await deleteDatabase(dbPath);
    _database = null;
  }
}
