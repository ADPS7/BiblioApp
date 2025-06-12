// lib/app_view
import 'package:biblioteca/screens/errorview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'screens/error_screen.dart';
import 'screens/home_screen.dart';
import 'screens/initial_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/results_screen.dart';

import 'bloc/book_bloc.dart';
import 'bloc/book_state.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookInitial) {
          return const InitialScreen(); // pantalla de bienvenida
        } else if (state is ShowHomeScreen) {
          return HomeScreen(); // buscador
        } else if (state is BookLoading) {
          return Loadingini();
        } else if (state is BookLoaded) {
          return ResultsScreen(books: state.books);
        } else if (state is BookError) {
          return Errorini();
        } else {
          return const InitialScreen(); // fallback
        }
      },
    );
  }
}
