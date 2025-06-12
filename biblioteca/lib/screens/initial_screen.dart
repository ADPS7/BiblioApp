import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/book_event.dart';
import '../bloc/book_bloc.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(), // Expande al tamaño completo de la pantalla
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://marketplace.canva.com/EAFGErflVT8/1/0/1600w/canva-fondo-virtual-para-zoom-abstract-VEq4C-mrSck.jpg"),
            fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bienvenido a la Biblioteca Virtual',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 158, 3, 125),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () => context.read<BookBloc>().add(GotoHome()),
                  icon: Icon(Icons.arrow_forward),
                  label: const Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}