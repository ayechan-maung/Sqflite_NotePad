import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_pad/consts/consts.dart';
import 'package:note_pad/database/local_db.dart';
import 'package:note_pad/database/note_model.dart';
import 'package:note_pad/pages/create_note_page.dart';

class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage(this.id);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ValueNotifier<Note> note;

  refreshDetail() async {
    var getNote = await LocalDatabase.instance.getNote(widget.id);
    note.value = getNote;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Note>(
        future: LocalDatabase.instance.getNote(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            note = ValueNotifier<Note>(snapshot.data!);
            return Column(
              children: [
                Expanded(
                  child: ValueListenableBuilder<Note>(
                      valueListenable: note,
                      builder: (context, snapNote, child) {
                        return ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    snapNote.title ?? '',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                Text(format.format(snapNote.dateTime!), style: Theme.of(context).textTheme.caption)
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(snapNote.description ?? "", textAlign: TextAlign.justify)
                          ],
                        );
                      }),
                ),
                SafeArea(
                  bottom: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () async {
                            await Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                    builder: (context) => CreateNotePage(isEdit: true, note: note.value),
                                  ),
                                )
                                .then((value) => refreshDetail());
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                        onPressed: dialog,
                        icon: Icon(Icons.delete_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  dialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Alert!'),
          actions: [
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Yes'),
              onPressed: () {
                LocalDatabase.instance.delete(widget.id);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
          content: Text('Are you sure want to delete?'),
        );
      },
    );
  }
}
