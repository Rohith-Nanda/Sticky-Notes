import 'package:flutter/material.dart';

class postButton extends StatelessWidget {
  final function;
  final text;
  const postButton({this.text,this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color:  Colors.pink,
                          child: Text(
                            'POST',
                            style: TextStyle(color: Colors.white),
                          )
                        ),
                        ),
                      ),
    );
                  
  }
}