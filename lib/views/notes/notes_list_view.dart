import 'package:flutter/material.dart';
import 'package:newproject/services/auth/crud/notes_service.dart';
import '../../utilities/dialogs/delete_dialog.dart';

typedef NoteCallBack = void Function(DatabaseNote note);

class NoteListView extends StatelessWidget {
  final List<DatabaseNote> notes;
  final NoteCallBack onDeleteNote;
  final NoteCallBack onTap;

  const NoteListView({
    Key? key,
    required this.notes,
    required this.onDeleteNote,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return ListTile(
          onTap: () {
            onTap(note);
          },
          title: Text(
            note.text,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () async {
              final shouldDelete = await showDeleteDialog(context);
              if (shouldDelete) {
                onDeleteNote(note);
              }
            },
            icon: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
