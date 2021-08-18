import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/screens/note_datails_screen.dart';
import 'package:note_app/widgets/note_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes;
  @override
  void initState() {
    super.initState();
    // notes = List.generate(
    //     20,
    //     (index) => Note(
    //         id: DateTime.now().toIso8601String(),
    //         title: 'Lorem ipsum dolor',
    //         description:
    //             "Ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim."));

    notes = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Today',
          style: TextStyle(color: Colors.black),
        ),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NoteDetailsScreen(
                    addFunction: addNewNote,
                  )));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: notes.length,
            itemBuilder: (context, index) => NoteItem(
                  noteItem: notes[index],
                  editeNote: editNote,
                  removeNote: removeNote,
                )),
      ),
    );
  }

  void addNewNote(Note newNote) {
    setState(() {
      notes.add(newNote);
    });
  }

  void editNote(String id, String title, String description) {
    //! [ , ,2, , , ]
    int indexOfEditNote = notes.indexWhere((note) => note.id == id);
    Note newNote = Note(id: id, title: title, description: description);
    setState(() {
      notes[indexOfEditNote] = newNote;
    });
  }

  void removeNote(String id) {
    setState(() {
      notes.removeWhere((note) => note.id == id);
    });
  }
}
