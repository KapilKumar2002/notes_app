import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notodo/data/repositories/note_repository_impl.dart';
import 'package:notodo/data/sources/note_local_source.dart';
import 'package:notodo/domain/entities/note.dart';
import 'package:notodo/domain/usecases/note/add_note.dart';
import 'package:notodo/domain/usecases/note/get_all_notes.dart';
import 'package:notodo/domain/usecases/note/update_note.dart';

import '../../domain/usecases/note/delete_note.dart';

class NoteNotifier extends StateNotifier<List<Note>> {
  final GetAllNotes getAllNotes;
  final AddNote addNote;
  final UpdateNote updateNote;
  final DeleteNote deleteNote;

  NoteNotifier(
      {required this.getAllNotes,
      required this.addNote,
      required this.updateNote,
      required this.deleteNote}) : super([]){
    loadNotes();
  }

  void loadNotes(){
    state = getAllNotes();
  }

  Future<void> add(Note note)async{
    await addNote(note);
    loadNotes();
  }

  Future<void> update(Note note) async {
    await updateNote(note);
    loadNotes();
  }

  Future<void> delete(String id) async {
    await deleteNote(id);
    loadNotes();
  }
}


final noteNotifierProvider = StateNotifierProvider<NoteNotifier, List<Note>>((ref) {
  // Normally these would come from service locator like getIt, but let's keep it simple:
  final noteRepo = NoteRepositoryImpl(NoteLocalSource());
  return NoteNotifier(
    getAllNotes: GetAllNotes(noteRepo),
    addNote: AddNote(noteRepo),
    updateNote: UpdateNote(noteRepo),
    deleteNote: DeleteNote(noteRepo),
  );
});

