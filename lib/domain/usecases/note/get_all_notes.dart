import 'package:notodo/domain/repositories/note_repository.dart';

import '../../entities/note.dart';

class GetAllNotes{
  final NoteRepository repository;

  GetAllNotes(this.repository);

  List<Note> call(){
    return repository.getAllNotes();
  }
}