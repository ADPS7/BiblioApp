import 'package:flutter/material.dart';

class Errorini extends StatelessWidget {
  const Errorini({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 100, 97, 97),
        centerTitle: true,
        title: Text('Error de carga', style: TextStyle(color: Colors.black)),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 27),
                Image.network(
                  'https://media.tenor.com/i8W2165dGc4AAAAM/library-reading.gif',
                ),
                SizedBox(height: 30),
                Text(
                  'Muchas solicitudes para el ',
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                Text(
                  'pinguino lector',
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                SizedBox(height: 15),
                Text(
                  '(Reintentelo mas tarde)',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                SizedBox(height: 19),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.transparent,
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.black,
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Regresar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
