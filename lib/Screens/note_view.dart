import 'package:flutter/material.dart';
import 'package:notes_application/models/NotesModel.dart';

class NoteView extends StatelessWidget {
  const NoteView(
      {super.key,
      required this.notes,
      required this.index,
      required this.onNoteDeleted});
  final Notes notes;
  final int index;
  final Function(int) onNoteDeleted;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(child: Text("Note View")),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Delete This ?"),
                      content: Text("Note ${notes.title} will be deleted!"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              onNoteDeleted(index);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "DELETE",
                              style: TextStyle(color: Colors.red),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("CANCEL")),
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red[400],
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notes.title,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              notes.body,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
