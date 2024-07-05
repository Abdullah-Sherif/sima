import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

final databaseServiceProvider = Provider<DatabaseService>((ref) => DatabaseService());

class DatabaseService {
  Database? database;

  Future<void> init() async {
    if (database != null) return;

    database = await openDatabase(
      path.join(await getDatabasesPath(), 'sima.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        var batch = db.batch();

        // Create tables

        await batch.commit();
      },
    );
  }
}
