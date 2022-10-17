import 'package:flutter/material.dart';
import 'package:todo_gsheets/google_sheets_api.dart';
import 'package:todo_gsheets/stickynote.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
            ), itemBuilder: (ctx,ind){
              return StickyNote(text: GoogleSheetsApi.currentnotes[ind]);
            },
            itemCount: GoogleSheetsApi.currentnotes.length,);
  }
}