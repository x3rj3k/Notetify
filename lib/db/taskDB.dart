import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:mobile_project/widget/task.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String taskTable = "taskTable";
  String taskID = "id";
  String title = "title";
  String task = "task";
  String date = "date";
  String time = "time";
  String status = "status";

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "tasks.db";

    var taskDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return taskDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $taskTable ($taskID INTEGER PRIMARY KEY AUTOINCREMENT,$title TEXT ,$task TEXT, $date TEXT, $time TEXT, $status TEXT)');
  }

  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database db = await this.database;
    var result = db.query(taskTable, orderBy: '$status, $date, $time');
    return result;
  }

  Future<List<Map<String, dynamic>>> getInCompleteTaskMapList() async {
    Database db = await this.database;
    var result = db.rawQuery(
        'SELECT * FROM $taskTable where $status = "" order by $date, $time ASC');
    return result;
  }

  Future<List<Map<String, dynamic>>> getCompleteTaskMapList() async {
    Database db = await this.database;
    var result = db.rawQuery(
        'SELECT * FROM $taskTable where $status = "Task Completed" order by $date, $time ASC');
    return result;
  }

  Future<int> insertTask(Task task) async {
    Database db = await this.database;
    var result = await db.insert(taskTable, task.toMap());
    return result;
  }

  Future<int> updateTask(Task task) async {
    var db = await this.database;
    var result = await db.update(taskTable, task.toMap(),
        where: '$taskID = ?', whereArgs: [task.id]);
    return result;
  }

  Future<int> deleteTask(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $taskTable WHERE $taskID=$id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $taskTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Task>> getTaskList() async {
    var taskMapList = await getTaskMapList();
    int count = taskMapList.length;

    List<Task> taskList = List<Task>();
    for (int i = 0; i < count; i++) {
      taskList.add(Task.fromMapObject(taskMapList[i]));
    }
    return taskList;
  }

  Future<List<Task>> getInCompleteTaskList() async {
    var taskMapList = await getInCompleteTaskMapList();
    int count = taskMapList.length;

    List<Task> taskList = List<Task>();
    for (int i = 0; i < count; i++) {
      taskList.add(Task.fromMapObject(taskMapList[i]));
    }
    return taskList;
  }

  Future<List<Task>> getCompleteTaskList() async {
    var taskMapList = await getCompleteTaskMapList();
    int count = taskMapList.length;

    List<Task> taskList = List<Task>();
    for (int i = 0; i < count; i++) {
      taskList.add(Task.fromMapObject(taskMapList[i]));
    }
    return taskList;
  }
}
