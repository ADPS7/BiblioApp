// lib/results_screen
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/book_card.dart';
import '../models/book.dart';
import '../bloc/book_bloc.dart';
import '../bloc/book_event.dart';
import '../bloc/book_state.dart';

class ResultsScreen extends StatelessWidget {
  final List<Book> books;

  const ResultsScreen({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookLoaded) {
          final displayedBooks = books.take(state.displayedBooksCount).toList();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Resultados'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
								onPressed: () => context.read<BookBloc>().add(GotoHome())
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '${books.length} resultado(s) encontrado(s)',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: displayedBooks.length + 1,
                    itemBuilder: (context, index) {
                      if (index < displayedBooks.length) {
                        return BookCard(book: displayedBooks[index]);
                      } else {
                        return state.displayedBooksCount < books.length
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.read<BookBloc>().add(LoadMoreBooks());
                                  },
                                  child: const Text('Ver más resultados'),
                                ),
                              )
                            : const SizedBox();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(); 
        }
      },
    );
  }
}
