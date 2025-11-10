import 'package:flutter/material.dart';
import '../blocs/note_bloc.dart';
import '../models/note_model.dart';

class AddNotePage extends StatefulWidget {
  final NoteBloc noteBloc;

  const AddNotePage({super.key, required this.noteBloc});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _saveNote() {
    if (_titleController.text.isNotEmpty &&
        _contentController.text.isNotEmpty) {
      widget.noteBloc.addNote(
        Note(
          id: DateTime.now().millisecondsSinceEpoch,
          title: _titleController.text,
          content: _contentController.text,
          createdAt: DateTime.now(),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Note")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Judul"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: "Isi Catatan"),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
