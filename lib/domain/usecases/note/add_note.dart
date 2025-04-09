import 'package:notodo/domain/repositories/note_repository.dart';

import '../../entities/note.dart';

class AddNote{
  final NoteRepository repository;

  AddNote(this.repository);

  Future<void> call(Note note){
    return repository.addNote(note);
  }
}