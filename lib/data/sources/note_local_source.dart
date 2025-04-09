import 'package:hive/hive.dart';
import 'package:notodo/data/models/note_model.dart';

class NoteLocalSource{
  final Box<NoteModel> box = Hive.box<NoteModel>('notes');

  List<NoteModel> getAllNotes(){
    return box.values.toList();
  }

  Future<void> addNote(NoteModel note)async{
    await box.put(note.id, note);
  }

  Future<void> deleteNote(String id)async{
    await box.delete(id);
  }

  Future<void> updateNote(NoteModel note)async{
    await box.put(note.id, note);
  }
}