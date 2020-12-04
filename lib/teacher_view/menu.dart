import 'package:flutter/material.dart';
import 'package:mobile_project/db/taskDB.dart';
import 'package:mobile_project/teacher_view/new_todo.dart';
import 'package:mobile_project/widget/customWidget.dart';
import 'package:mobile_project/widget/datepicker.dart';
import 'package:mobile_project/widget/task.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:mobile_project/widget/localizations.dart';

class TodoTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return todo_state();
  }
}

class todo_state extends State<TodoTask> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  Utils utility = new Utils();
  List<Task> taskList;
  int count = 0;
  final homeScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (taskList == null) {
      taskList = List<Task>();
      updateListView();
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          key: homeScaffold,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context).title(),
              style: TextStyle(fontSize: 25),
            ),
            actions: <Widget>[],
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.format_list_numbered_rtl),
              ),
              Tab(
                icon: Icon(Icons.playlist_add_check),
              )
            ]),
          ),
          body: TabBarView(children: [
            new Container(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: FutureBuilder(
                      future: databaseHelper.getInCompleteTaskList(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data.length < 1) {
                          return Center(
                            child: Text(
                              'No Tasks Added',
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int position) {
                              return new GestureDetector(
                                onTap: () {
                                  if (snapshot.data[position].status !=
                                      "Task Completed")
                                    navigateToTask(snapshot.data[position],
                                        "Edit Task", this);
                                },
                                child: Card(
                                  margin: EdgeInsets.all(1.0),
                                  elevation: 2.0,
                                  child: CustomWidget(
                                    title: snapshot.data[position].task,
                                    sub1: snapshot.data[position].date,
                                    sub2: snapshot.data[position].time,
                                    status: snapshot.data[position].status,
                                    delete: snapshot.data[position].status ==
                                            "Task Completed"
                                        ? IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: null,
                                          )
                                        : Container(),
                                    trailing: Icon(
                                      Icons.edit,
                                      color: Theme.of(context).primaryColor,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  )
                ],
              ),
            ), //Container
            new Container(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: FutureBuilder(
                      future: databaseHelper.getCompleteTaskList(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data.length < 1) {
                          return Center(
                            child: Text(
                              'No Tasks Completed',
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int position) {
                              return new GestureDetector(
                                  onTap: () {
                                    if (snapshot.data[position].status !=
                                        "Task Completed")
                                      navigateToTask(snapshot.data[position],
                                          "Edit Task", this);
                                  },
                                  child: Card(
                                    margin: EdgeInsets.all(1.0),
                                    elevation: 2.0,
                                    child: CustomWidget(
                                        title: snapshot.data[position].task,
                                        sub1: snapshot.data[position].date,
                                        sub2: snapshot.data[position].time,
                                        status: snapshot.data[position].status,
                                        delete:
                                            snapshot.data[position].status ==
                                                    "Task Completed"
                                                ? IconButton(
                                                    icon: Icon(Icons.delete,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        size: 28),
                                                    onPressed: () {
                                                      delete(snapshot
                                                          .data[position].id);
                                                    },
                                                  )
                                                : Container(),
                                        trailing: Container()),
                                  ) //Card
                                  );
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
          ]),
          floatingActionButton: FloatingActionButton(
              tooltip: "Add Task",
              child: Icon(Icons.add),
              onPressed: () {
                navigateToTask(Task('', '', '', ''), "Add Task", this);
              }),
        ));
  }

  void navigateToTask(Task task, String title, todo_state obj) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new_task(task, title, obj)),
    );
    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();

    dbFuture.then((database) {
      Future<List<Task>> taskListFuture = databaseHelper.getTaskList();
      taskListFuture.then((taskList) {
        setState(() {
          this.taskList = taskList;
          this.count = taskList.length;
        });
      });
    });
  }

  void delete(int id) async {
    await databaseHelper.deleteTask(id);
    updateListView();
    utility.showSnackBar(homeScaffold, 'Task Deleted Successfully');
  }
}
