import 'package:biblioteca/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/book_state.dart';
import '../bloc/book_bloc.dart';
import '../bloc/book_event.dart';

class Errorini extends StatelessWidget {
  const Errorini({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 166, 229),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 100, 97, 97),
        centerTitle: true,
        title: Text(
          'Error de carga',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'pinguino lector',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(height: 19),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black,
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {
                    context.read<BookBloc>().add(GotoHome());
                  },
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
