import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';

class NoteItem extends StatelessWidget {
  final Note noteItem;

  const NoteItem({Key key, @required this.noteItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Text(
            noteItem.title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.deepOrange),
          ),
          SizedBox(height: 16,),
          Text(noteItem.description,overflow: TextOverflow.fade,maxLines: 5,
          textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
