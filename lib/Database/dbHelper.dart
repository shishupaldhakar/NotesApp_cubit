import 'dart:io';

import 'package:notesapp_cubit/Models/notes_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper instance = DbHelper._();
  Database? _database;
  static const noteTable = 'NoteTable';
  static const noteId = 'NoteId';
  static const noteTitle = 'NoteTitle';
  static const noteDesc = 'NoteDesc';
  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbPath = join('${directory.path}notes-db.db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(
          'create table $noteTable ($noteId integer primary key autoincrement,$noteTitle text,$noteDesc text )');
    });
  }

  addNotes(NotesModel notesModel) async {
    var db = await getDb();
    db.insert(noteTable, notesModel.toMap());
  }
  Future<List<NotesModel>> getData ()async{
    var db = await getDb();
    List<NotesModel>arrayList= [];
    var data = await db.query(noteTable);
    for(Map<String, dynamic> eachData in data ){
      NotesModel notesModel = NotesModel.fromMap(eachData);
       arrayList.add(notesModel);
    }
    return arrayList;
  }
  Future<bool>updateNote(NotesModel notesModel)async{
 var db = await getDb();
 var count = await db.update(noteTable, notesModel.toMap(),where: '$noteId=${notesModel.id}');
 return count>0;
  }
    Future<bool> deletNote(int id)async{
    var db = await getDb();
   var count = await db.delete(noteTable, where: "$noteId= ?",whereArgs: [id]);
   return count>0;
  }
}
