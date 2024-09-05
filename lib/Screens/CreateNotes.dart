import 'package:flutter/material.dart';
import 'package:notes_application/models/NotesModel.dart';

class CreateNotes extends StatefulWidget {
  const CreateNotes({super.key, required this.onNewNoteCreated});
  final Function(Notes) onNewNoteCreated;

  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "New Notes",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 24,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: bodyController,
              style: const TextStyle(
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Body"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            return;
          }
          if (bodyController.text.isEmpty) {
            return;
          }
          final note = Notes(
            body: bodyController.text,
            title: titleController.text,
          );
          widget.onNewNoteCreated(note);

          Navigator.pop(context);
        },
        child: const Icon(Icons.save_rounded),
      ),
    );
  }
}
