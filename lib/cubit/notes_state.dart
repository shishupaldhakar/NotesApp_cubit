import '../Models/notes_model.dart';

abstract class NotesState{}
class InitialState extends NotesState{}
class LoadingState extends NotesState{}
class LoadedState extends NotesState{
 List<NotesModel>?arrayNotes= [];
 int? id;

 LoadedState({this.arrayNotes, this.id});
}
class ErrorState extends NotesState{
 String errorMsg;
 ErrorState({required this.errorMsg});
}