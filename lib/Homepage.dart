import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_gsheets/button.dart';
import 'package:todo_gsheets/circular_loading.dart';
import 'package:todo_gsheets/google_sheets_api.dart';
import 'package:todo_gsheets/notes_grid.dart';
import 'package:todo_gsheets/stickynote.dart';

class Hompage extends StatefulWidget {

   Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  final _controller = TextEditingController();
   @override
  void initState() {
    super.initState();
    _controller.addListener(() {return setState(() {});});
  }
  void startloading(){
    Timer.periodic(Duration(seconds: 1),(timer){
      if(GoogleSheetsApi.loading == false){
        setState(() {});
        timer.cancel();
      }
    });
  }
  void _post(){ 
    GoogleSheetsApi.insert(_controller.text);
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if(GoogleSheetsApi.loading == true){
      startloading();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("post a note",style: GoogleFonts.slabo27px(fontSize: 35,color: Colors.grey[600])),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(child: Container(
            child: GoogleSheetsApi.loading == true ? LoadingCirc():NotesGrid()
          )),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                     controller: _controller,
                      decoration: InputDecoration(
                      hintText: "enter ...",
                      border: OutlineInputBorder(
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: (){
                          _controller.clear();
                        },
                      )
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('@ c r e a t e d b y s a g e'),
                    ),
                    postButton(
                      text : "P O S T",
                      function: _post,
                    )
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }
}