import 'package:flutter/material.dart';
import 'blocs/note_bloc.dart';
import 'pages/home_pages.dart';
import 'pages/add_note_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final NoteBloc _noteBloc;

  @override
  void initState() {
    super.initState();
    _noteBloc = NoteBloc(); // inisialisasi di sini
  }

  @override
  void dispose() {
    _noteBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      // ⬇️ routes harus di dalam build() agar bisa pakai _noteBloc
      routes: {
        '/': (context) => HomePage(noteBloc: _noteBloc),
        '/add-note': (context) => AddNotePage(noteBloc: _noteBloc),
      },
    );
  }
}
