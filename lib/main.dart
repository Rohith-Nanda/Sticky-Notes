import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:todo_gsheets/Homepage.dart';
import 'package:todo_gsheets/google_sheets_api.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetsApi().init();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      debugShowCheckedModeBanner: false,
      home: Hompage(),
    ); 
  }
}