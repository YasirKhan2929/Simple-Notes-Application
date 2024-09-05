import 'package:flutter/material.dart';
import 'package:notes_application/Screens/note_view.dart';
import 'package:notes_application/models/NotesModel.dart';

class noteCard extends StatelessWidget {
  const noteCard({
    super.key,
    required this.notes,
    required this.index,
    required this.onNoteDeleted,
  });

  final Notes notes;
  final int index;
  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteView(
                notes: notes,
                index: index,
                onNoteDeleted: onNoteDeleted,
              ),
            ));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notes.title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                notes.body,
                style: const TextStyle(
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
