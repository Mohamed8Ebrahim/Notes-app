// ignore_for_file: file_names

class AddNotesState{}
class NotesIntial extends AddNotesState{}
class NotesLoading extends AddNotesState{}
class NotesSuccess extends AddNotesState{}
class NotesFailuire extends AddNotesState{
  final String errorMessage;

  NotesFailuire(this.errorMessage);
}