import 'package:bloc/bloc.dart';
import 'package:notesapp_cubit/cubit/notes_state.dart';

import '../Database/dbHelper.dart';
import '../Models/notes_model.dart';

class NotesCubit extends Cubit<NotesState> {
  DbHelper dbHelper;
  NotesCubit({required this.dbHelper}) : super(InitialState());

  addNote(NotesModel notesModel) async {
    bool check = await dbHelper.addNotes(notesModel);
    if (check) {
      var note = await dbHelper.getData();
      emit(LoadedState(arrayNotes: note));
    }
  }

  fetchAllData() async {
    emit(LoadingState());
    var db = await dbHelper.getData();
    emit(LoadedState(arrayNotes: db));
  }
  updateData(NotesModel notesModel)async{
    var db = await dbHelper.updateNote(notesModel);
    if (db){
      var note = await dbHelper.getData();
      emit(LoadedState(arrayNotes: note));
    }
  }

  deletData(int id) async {
    bool db = await dbHelper.deletNote(id);
    if (db) {
      var note = await dbHelper.getData();
      emit(LoadedState(arrayNotes: note));
    }
  }
}
