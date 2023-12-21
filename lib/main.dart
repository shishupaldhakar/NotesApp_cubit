import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp_cubit/Database/dbHelper.dart';
import 'package:notesapp_cubit/cubit/notes_cubit.dart';
import 'package:notesapp_cubit/screen/note_app.dart';
void main (){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>NotesCubit(dbHelper:DbHelper.instance),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:NotesApp()
      ),
    );
  }
}
