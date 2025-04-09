import '../entities/note.dart';

abstract class NoteRepository{
  List<Note> getAllNotes();
  Future<void> addNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNote(String id);
}