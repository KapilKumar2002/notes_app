import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/note.dart';
import '../providers/note_provider.dart';

class AddEditNoteScreen extends ConsumerStatefulWidget {
  final Note? note;

  const AddEditNoteScreen({super.key, this.note});

  @override
  ConsumerState<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends ConsumerState<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveNote() {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty && content.isEmpty) return;

    final note = Note(
      id: widget.note?.id ?? const Uuid().v4(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );

    if (widget.note == null) {
      ref.read(noteNotifierProvider.notifier).add(note);
    } else {
      ref.read(noteNotifierProvider.notifier).update(note);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700
              ),
              controller: _titleController,
              decoration: const InputDecoration(
                  hintText: 'Title...', border: InputBorder.none),
            ),
            Expanded(
              child: TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                controller: _contentController,
                decoration: const InputDecoration(
                    hintText: 'Write content here...',
                    border: InputBorder.none),
                maxLines: null,
                expands: true,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(250, 55)),
              onPressed: _saveNote,
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
