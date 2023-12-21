import 'package:notesapp_cubit/Database/dbHelper.dart';

class NotesModel{
  int? id;
  String title;
  String desc;

  NotesModel({this.id, required this.title, required this.desc});
  factory NotesModel.fromMap(Map<String, dynamic>map){
    return NotesModel(title: map[DbHelper.noteTitle], desc: map[DbHelper.noteDesc],id:map[DbHelper.noteId]);
  }
  Map<String,dynamic>toMap(){
    return {
      DbHelper.noteId:id,
      DbHelper.noteTitle:title,
      DbHelper.noteDesc:desc
    };
  }
}