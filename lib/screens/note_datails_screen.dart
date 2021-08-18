import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';

class NoteDetailsScreen extends StatefulWidget {
  final Note note;
  final Function(Note note) addFunction;
  final Function(String id, String title, String description) editeNote;
  NoteDetailsScreen({Key key, this.note, this.addFunction, this.editeNote})
      : super(key: key);

  @override
  _NoteDetailsScreenState createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  TextEditingController titleController;
  TextEditingController descriptionController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController = TextEditingController(text: widget.note.title);
      descriptionController =
          TextEditingController(text: widget.note.description);
    } else {
      titleController = TextEditingController();
      descriptionController = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Note Details',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                // TODO : ADD
                if (!_formKey.currentState.validate()) {
                  return;
                }
                if (widget.note == null) {
                  widget.addFunction(Note(
                      id: DateTime.now().toIso8601String(),
                      title: titleController.text,
                      description: descriptionController.text));
                  Navigator.of(context).pop();
                }
                //TODO : Save Note
                else {
                  widget.editeNote(widget.note.id, titleController.text,
                      descriptionController.text);
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[100],
                  filled: true,
                  hintText: 'Title',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'You must fill title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: descriptionController,
                maxLines: 20,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[100],
                  filled: true,
                  hintText: 'Description',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'You must fill description';
                  }
                  return null;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
