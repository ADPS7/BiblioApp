import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'results_screen.dart';
import 'bloc/principal_bloc.dart';
import 'bloc/principal_state.dart';
import 'bloc/principal_event.dart';

class PrincipalScreen extends StatelessWidget {
  PrincipalScreen({super.key});

  // Controladores para los campos de texto
  final titleController = TextEditingController();
  final authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrincipalBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('BÚSQUEDA DE LIBROS'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Campo de Título
                  TextField(
                    controller: titleController,
                    decoration:
                        const InputDecoration(labelText: 'Título del libro'),
                  ),

                  const SizedBox(height: 10),

                  // Campo de Autor
                  TextField(
                    controller: authorController,
                    decoration:
                        const InputDecoration(labelText: 'Autor del libro'),
                  ),

                  const SizedBox(height: 20),

                  // Botón de búsqueda
                  ElevatedButton(
                    onPressed: () {
                      final title = titleController.text.trim();
                      final author = authorController.text.trim();

                      // Validación: al menos un campo debe tener valor
                      if (title.isEmpty && author.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Por favor ingresa un título o un autor.'),
                          ),
                        );
                        return;
                      }

                      // ✔️ CORRECTO: Ahora puedes usar read() porque estamos dentro del Builder
                      context.read<PrincipalBloc>().add(
                            SearchBooksEvent(title: title, author: author),
                          );
                    },
                    child: const Text('Buscar Libros'),
                  ),

                  const SizedBox(height: 20),

                  // Escucha cambios del BLoC
                  BlocConsumer<PrincipalBloc, PrincipalState>(
                    listener: (context, state) {
                      if (state is SuccessPrincipalState) {
                        // ✔️ Navegación correcta SIEMPRE QUE ResultsScreen exista
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResultsScreen(
                              books: state.books,
                              totalResults: state.totalResults,
                            ),
                          ),
                        );
                      } else if (state is EmptyPrincipalState) {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Sin resultados'),
                            content:
                                const Text('No se encontraron libros.'),
                            actions: [
                              TextButton(
                                onPressed: Navigator.of(context).pop,
                                child: const Text('Cerrar'),
                              )
                            ],
                          ),
                        );
                      } else if (state is ErrorPrincipalState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingPrincipalState) {
                        return const Center(
                            child: CircularProgressIndicator());
                      }
                      return const SizedBox.shrink(); // No mostrar nada si no está cargando
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
























