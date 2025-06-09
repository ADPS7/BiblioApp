import 'package:flutter/material.dart';

class Errorini extends StatelessWidget {
  const Errorini({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: const Color.fromARGB(255, 100, 97, 97),
        centerTitle: true,
        title: Text('Error de carga', style: TextStyle(color: Colors.black),),
      ),
      body: 
      Stack(
        children: [
          Positioned.fill(
            child:
            Image.network('https://p1.pikrepo.com/preview/824/280/1015/book-old-vintage-paper-texture-parchment.jpg', fit: BoxFit.cover,)
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 27,),
                Image.network('https://media.tenor.com/i8W2165dGc4AAAAM/library-reading.gif'),
                SizedBox(height: 30,),
                Text('Muchas solicitudes para el ', style: TextStyle(fontSize: 25, color: Colors.red),),
                Text('pinguino lector', style: TextStyle(fontSize: 25, color:  Colors.red),),
                SizedBox(height: 15,),
                Text('(Reintentelo mas tarde)', style: TextStyle(color: Colors.red, fontSize: 15),),
                SizedBox(height: 19,),
                Image.network('https://cdn.pixabay.com/animation/2022/12/26/19/45/19-45-56-484__480.png', height: 140,)
              ],
            ) ,)
        ],
      )
      );
  }
}