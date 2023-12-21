import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp_cubit/Models/notes_model.dart';
import 'package:notesapp_cubit/Widget/ui_helper.dart';
import 'package:notesapp_cubit/cubit/notes_cubit.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotesApp"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(titleController, 'Title', Icons.title),
          UiHelper.CustomTextField(
              descController, 'Description', Icons.description_outlined),
          SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                var title = titleController.text.toString();
                var desc = descController.text.toString();
                context
                    .read<NotesCubit>()
                    .addNote(NotesModel(title: title, desc: desc));
                Navigator.pop(context);

                context.read<NotesCubit>().fetchAllData();
              },
              child: Text('Save Data'))
        ],
      ),
    );
  }
}
