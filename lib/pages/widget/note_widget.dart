import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_pad/database/local_db.dart';
import 'package:note_pad/database/note_model.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  NoteWidget({Key? key, required this.note}) : super(key: key);

  late ValueNotifier<Note> noteValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade600), borderRadius: BorderRadius.circular(6)),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(DateFormat.yMMMd().format(note.dateTime!), style: Theme.of(context).textTheme.caption),
              ],
            ),
            SizedBox(height: 6),
            Text(
              note.title ?? "",
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
            ),
            SizedBox(height: 8),
            Text(note.description ?? "", style: Theme.of(context).textTheme.caption, maxLines: 4, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  noteRefresh() async {
    await LocalDatabase.instance.getAllNotes();
    // setState(() {});
  }
}
