import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingCirc extends StatelessWidget {
  const LoadingCirc({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        child: Lottie.network("https://assets2.lottiefiles.com/packages/lf20_hylaaytn.json"),
      );
    
  }
}