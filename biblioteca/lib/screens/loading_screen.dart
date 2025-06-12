// lib/screens/loading_screen
import 'package:flutter/material.dart';

class Loadingini extends StatelessWidget {
  const Loadingini({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Por favor espere', style: TextStyle(color: Colors.white),),
       ) ,
       body: Stack(
        children: [
          Positioned.fill(child:
           Image.network('https://static9.depositphotos.com/1155387/1233/i/450/depositphotos_12337909-stock-photo-wooden-book-shelf.jpg', fit: BoxFit.cover,)
           
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 21,),
                Image.network('https://i.postimg.cc/N0QZy69C/Tenor-unscreen.gif', height: 237,),
                SizedBox(height: 26,),
                CircularProgressIndicator.adaptive(backgroundColor: Colors.brown,),
                SizedBox(height: 17,),
                Text('Cargando ...', style: TextStyle(fontSize: 25, color: Colors.black),)
              ],
            ),
          )
        ],
       ),
    );
  }
}
