import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._internal();
  static Database? _database;
  DBHelper._internal();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'scores.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
CREATE TABLE scores(
id INTEGER PRIMARY KEY AUTOINCREMENT,
date TEXT,
score INTEGER
)
''');
      },
    );
  }

  Future<int> insertScore(int score) async {
    final db = await database;
    return await db.insert('scores', {
      'date': DateTime.now().toString(),
      'score': score,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getScores() async {
    final db = await database;
    return await db.query('scores', orderBy: 'id DESC');
  }

  Future<void> clearScores() async {
    final db = await database;
    await db.delete('scores');
  }
}
