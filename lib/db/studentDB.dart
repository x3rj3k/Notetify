import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class StudentDB {
  static StudentDB _studentDB;
  static Database _database;

  String studentTable = "studentTable";
  int studentID;
  String lastname = "lastname";
  String firstname = "firstname";
  String email = "email";
  String password = "password";

  StudentDB._createInstance();

  factory StudentDB() {
    if (_studentDB == null) {
      _studentDB = StudentDB._createInstance();
    }
    return _studentDB;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    //Get the directory path for both Android and iOS to store Database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "student.db";

    //Open/Create the database at the given path
    var taskDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return taskDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $studentTable ($studentID INTEGER PRIMARY KEY AUTOINCREMENT, $firstname TEXT, $lastname TEXT, $email TEXT, $password TEXT)');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    _database = await _studentDB.database;
    return await _database.insert(studentTable, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    _database = await _studentDB.database;
    return await _database.query(studentTable);
  }
}
