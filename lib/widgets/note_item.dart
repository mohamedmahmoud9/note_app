import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/screens/note_datails_screen.dart';

class NoteItem extends StatelessWidget {
  final Note noteItem;
  final Function(String id, String title, String description) editeNote;
  final Function(String id) removeNote;
  NoteItem(
      {Key key,
      @required this.noteItem,
      @required this.editeNote,
      @required this.removeNote})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NoteDetailsScreen(
                note: noteItem,
                editeNote: editeNote,
              ))),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => removeNote(noteItem.id)),
            Text(
              noteItem.title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepOrange),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              noteItem.description,
              overflow: TextOverflow.fade,
              maxLines: 5,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
