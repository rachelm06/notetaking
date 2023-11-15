import 'package:flutter/material.dart';

void main() {
  runApp(NoteTakingApp());
}

class NoteTakingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Note Taking App'),
        ),
        body: NoteList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Generate a sample note and add it to the list
            Note newNote = PersonalNote(
              title: 'New Note ${DateTime.now().toString()}',
              content: 'Sample excerpt text goes here',
              dateCreated: DateTime.now(),
              isUrgent: true,
            );
            NoteListState.addNewNote(newNote);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

// Base class for a Note
class Note {
  final String title;
  final String content;
  final DateTime dateCreated;

  Note({
    required this.title,
    required this.content,
    required this.dateCreated,
  });
}

// Derived class (PersonalNote) with urgency represented as a boolean
class PersonalNote extends Note {
  final bool isUrgent;

  PersonalNote({
    required String title,
    required String content,
    required DateTime dateCreated,
    required this.isUrgent,
  }) : super(
          title: title,
          content: content,
          dateCreated: dateCreated,
        );
}

class NoteList extends StatefulWidget {
  @override
  NoteListState createState() => NoteListState();
}

class NoteListState extends State<NoteList> {
  static List<Note> notes = [
    PersonalNote(
      title: 'Research meeting',
      content: 'Report findings',
      dateCreated: DateTime.now(),
      isUrgent: true,
    ),
    PersonalNote(
      title: 'Buy dog food',
      content: 'Buy 2 bags',
      dateCreated: DateTime.now(),
      isUrgent: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notes[index].title),
          subtitle: Text(notes[index].content),
        );
      },
    );
  }

  // Function to add a new note to the list
  static void addNewNote(Note newNote) {
    notes.add(newNote);
    // Update the UI to reflect the new note
    

    
  }
}