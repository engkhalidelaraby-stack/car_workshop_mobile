import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'car_workshop.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE cars(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            plate TEXT,
            owner TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE reports(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            plate TEXT,
            description TEXT
          )
        ''');
      },
    );
  }

  // Insert car
  Future<void> insertCar(String plate, String owner) async {
    final db = await database;
    await db.insert('cars', {
      'plate': plate,
      'owner': owner,
    });
  }

  // Insert report
  Future<void> insertReport(String plate, String description) async {
    final db = await database;
    await db.insert('reports', {
      'plate': plate,
      'description': description,
    });
  }

  // Get reports
  Future<List<Map<String, dynamic>>> getReports() async {
    final db = await database;
    return await db.query('reports');
  }

  // Search
  Future<List<Map<String, dynamic>>> searchAll(String keyword) async {
    final db = await database;
    return await db.rawQuery('''
      SELECT plate, owner AS info FROM cars
      WHERE plate LIKE ? OR owner LIKE ?
      UNION
      SELECT plate, description AS info FROM reports
      WHERE plate LIKE ? OR description LIKE ?
    ''', [
      '%$keyword%',
      '%$keyword%',
      '%$keyword%',
      '%$keyword%',
    ]);
  }
}

