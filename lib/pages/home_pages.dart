import 'package:flutter/material.dart';
import '../blocs/note_bloc.dart';

class HomePage extends StatelessWidget {
  final NoteBloc noteBloc;

  const HomePage({super.key, required this.noteBloc});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes App")),
      body: StreamBuilder(
        stream: noteBloc.notesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Belum ada catatan"));
          }
          final notes = snapshot.data!;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => noteBloc.deleteNote(note.id!),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add-note'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
