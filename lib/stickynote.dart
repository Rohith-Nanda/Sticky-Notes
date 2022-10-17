import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StickyNote extends StatelessWidget {
  final String text;
  const StickyNote({super.key,required this.text});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          color: Colors.yellow[200],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(child: Text(text,style: GoogleFonts.squarePeg(fontWeight: FontWeight.w200,fontSize: 35))),
          ),
        ),
      ),
    );
  }
}