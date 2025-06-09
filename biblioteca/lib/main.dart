import 'package:flutter/material.dart';
import 'features/home/presentation/views/success/principal_screen.dart'; // Asegúrate que esta ruta sea correcta.

void main() {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Búsqueda de Libros',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: PrincipalScreen(),
    );
  }
}

