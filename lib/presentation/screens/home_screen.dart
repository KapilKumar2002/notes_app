import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notodo/presentation/widgets/theme_toggle_button.dart';
import '../providers/note_provider.dart';
import 'add_edit_note_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(noteNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        centerTitle: true,
        actions: [
          ThemeToggleButton()
        ],
      ),
      body: notes.isEmpty
          ? const Center(child: Text("No notes yet. Tap '+' to add one!"))
          : ListView.builder(
        itemCount: notes.length,
        itemBuilder: (_, index) {
          final note = notes[index];
          return Dismissible(
            key: Key(note.id),
            onDismissed: (_) {
              ref.read(noteNotifierProvider.notifier).delete(note.id);
            },
            background: Container(color: Colors.redAccent),
            child: ListTile(
              leading: Icon(Icons.notes),
              title: Text(note.title),
              subtitle: Text(
                note.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddEditNoteScreen(note: note),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddEditNoteScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
