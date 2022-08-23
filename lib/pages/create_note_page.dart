import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_pad/database/local_db.dart';
import 'package:note_pad/database/note_model.dart';
import 'package:note_pad/pages/widget/form_widget.dart';

class CreateNotePage extends StatefulWidget {
  final bool isEdit;
  final Note? note;
  const CreateNotePage({Key? key, this.isEdit = false, this.note}) : super(key: key);

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final titleCon = TextEditingController();
  final descCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      if (widget.note != null) {
        titleCon.text = widget.note!.title!;
        descCon.text = widget.note!.description!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final isValid = _formKey.currentState!.validate();
              if (isValid) {
                if (widget.isEdit) {
                  final note = widget.note!.copyWith(title: titleCon.text, description: descCon.text);
                  await LocalDatabase.instance.updateNote(note);
                } else {
                  final note = Note(title: titleCon.text, description: descCon.text, dateTime: DateTime.now());
                  await LocalDatabase.instance.createNote(note);
                  // await LocalDatabase.instance.getAllNotes();
                }
                Navigator.of(context).pop();
              }
            },
            icon: Icon(CupertinoIcons.check_mark),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          children: [
            FormWidget(
              controller: titleCon,
              fontSize: 22,
              hintText: 'Title',
              // validate: (s) {
              //   if (s!.isEmpty) {
              //     return 'This field can not be blank';
              //   } else {
              //     return null;
              //   }
              // },
            ),
            SizedBox(height: 10),
            FormWidget(
              controller: descCon,
              fontSize: 18,
              maxLine: null,
              hintText: 'Description',
              validate: (s) {
                if (s!.isEmpty) {
                  return 'This field can not be blank';
                } else {
                  return null;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
