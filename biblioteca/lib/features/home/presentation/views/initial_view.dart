import 'package:biblioteca/features/home/presentation/views/success/bloc/principal_bloc.dart';
import 'package:biblioteca/features/home/presentation/views/success/bloc/principal_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Initial extends StatelessWidget {
  const Initial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
    // Fondo con imagen
    Opacity(
      opacity: 1,
      child: Image.network(
        'https://okdiario.com/img/2022/11/22/libros-4.jpg',
        fit: BoxFit.cover,
      ),
    ),
    // Contenido centrado
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Referencias de libros",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Asegúrate que contraste con el fondo
            ),
          ),
          SizedBox(height: 20), // Espacio entre texto y botón
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                final homeBloc = BlocProvider.of<PrincipalBloc>(context);
                  homeBloc.add(SearchBooksEvent(title: 'Book Title', author: 'Book Author'));
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Bienvenido!'),
            ),
          ),
        ],
      ),
    ),
        ],
      ),
    );
  }
}

