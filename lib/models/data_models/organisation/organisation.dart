import 'package:flutter/material.dart';
import 'package:inertia/main.dart';
import 'package:inertia/models/models.dart';
import 'package:isar/isar.dart';

part 'organisation.g.dart';

final oranisationCol = isar.collection<Organisation>();

@collection
class Organisation {
  Id id = Isar.autoIncrement;
  String? name;
  bool isSelected = true;
  final projects = IsarLinks<Project>();

  @ignore
  TextEditingController textController = TextEditingController(text: "New Organisation");
}
