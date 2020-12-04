import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  static final String tableName = 'category';

  static final String columnId = 'id';
  static final String columnName = 'name';

  static const String allLists = 'All Lists';
  static const String deFault = 'Default';
  static const String assignment = 'Assignment';
  static const String activity = 'Activity';
  static const String announcement = 'Announcement';
  static const String exam = 'Exam';
  static const String finished = 'Finished';

  int id;
  String name;

  Category({this.id, @required this.name});

  Map toMap() {
    return <String, dynamic>{columnName: name};
  }

  Category.fromMap(Map map) {
    id = map[columnId];
    name = map[columnName];
  }

  IconData getIcon() {
    switch (name) {
      case assignment:
        return FontAwesomeIcons.user;
      case activity:
        return FontAwesomeIcons.shoppingCart;
      case announcement:
        return FontAwesomeIcons.heart;
      case exam:
        return Icons.work;
      case finished:
        return Icons.check;
      default:
        return FontAwesomeIcons.list;
    }
  }
}
