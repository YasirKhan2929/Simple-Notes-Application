import 'package:flutter/material.dart';
import 'package:notes_application/Screens/CreateNotes.dart';
import 'package:notes_application/models/NotesModel.dart';
import 'package:notes_application/widget/NoteCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Notes> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Flutter Note",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.blueGrey[900],
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateNotes(
                        onNewNoteCreated: onNewNoteCreated,
                      )));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return noteCard(
              notes: notes[index],
              index: index,
              onNoteDeleted: onNoteDeleted,
            );
          }),
    );
  }

  void onNewNoteCreated(Notes note) {
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
