import 'package:biblioteca/features/home/presentation/views/loadingview.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Lib());
}

class Lib extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca Portatil',
      home: Loadingini(),
    );
  }

}

