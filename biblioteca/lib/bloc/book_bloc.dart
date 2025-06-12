// lib/bloc/book_bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_event.dart';
import 'book_state.dart';
import '../services/book_api.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookApi bookApi = BookApi();



  BookBloc() : super(BookInitial()) {
    on<SearchBooks>((event, emit) async {
      emit(BookLoading());
      try {
        final books = await bookApi.searchBooks(event.query);
        if (books.isEmpty) {
          emit(BookError());
        } else {
          emit(BookLoaded(books: books));
        }
      } catch (_) {
        emit(BookError());
      }
    });

    on<LoadMoreBooks>((event, emit) {
      if (state is BookLoaded) {
        final currentState = state as BookLoaded;
        final currentCount = currentState.displayedBooksCount;
        final maxToShow = currentCount + 20;

        emit(currentState.copyWith(newDisplayedCount: maxToShow));
      }
    });


		on<GotoHome>((event, emit) {
			emit(ShowHomeScreen());
		});
  }
}
