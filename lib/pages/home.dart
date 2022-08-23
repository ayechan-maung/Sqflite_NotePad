import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_pad/database/local_db.dart';
import 'package:note_pad/database/note_model.dart';
import 'package:note_pad/pages/create_note_page.dart';
import 'package:note_pad/pages/detail_page.dart';
import 'package:note_pad/pages/widget/note_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNotePage())).then((value) => noteRefresh());
            },
            icon: Icon(Icons.add_comment),
          )
        ],
      ),
      body: FutureBuilder<List<Note>>(
        future: LocalDatabase.instance.getAllNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Note> notes = snapshot.data!;
            if (notes.isNotEmpty) {
              return MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(notes[index].id!))).then(
                            (value) => noteRefresh(),
                          );
                    },
                    child: NoteWidget(note: notes[index]),
                  );
                },
              );
            } else {
              return Center(child: Icon(Icons.add_comment));
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  noteRefresh() async {
    await LocalDatabase.instance.getAllNotes();
    setState(() {});
  }
}
