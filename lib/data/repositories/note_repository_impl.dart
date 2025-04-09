import 'package:notodo/data/models/note_model.dart';
import 'package:notodo/data/sources/note_local_source.dart';

import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalSource localSource;

  NoteRepositoryImpl(this.localSource);

  @override
  Future<void> addNote(Note note) {
    // TODO: implement addNote
    final noteModel = NoteModel(
        id: note.id,
        title: note.title,
        content: note.content,
        createdAt: note.createdAt);
    return localSource.addNote(noteModel);
  }

  @override
  Future<void> deleteNote(String id) => localSource.deleteNote(id);

  @override
  List<Note> getAllNotes() {
    // TODO: implement getAllNotes
    return localSource.getAllNotes().map((note) {
      return Note(
          id: note.id,
          title: note.title,
          content: note.content,
          createdAt: note.createdAt);
    }).toList();
  }

  @override
  Future<void> updateNote(Note note) {
    // TODO: implement updateNote
    final updatedNote = NoteModel(
        id: note.id,
        title: note.title,
        content: note.content,
        createdAt: note.createdAt);
    return localSource.updateNote(updatedNote);
  }
}
