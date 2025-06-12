// lib/bloc/book_state
import 'package:equatable/equatable.dart';
import '../models/book.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class ShowHomeScreen extends BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}


class BookLoaded extends BookState {
  final List<Book> books;
  final int displayedBooksCount;

  const BookLoaded({
    required this.books,
    this.displayedBooksCount = 20,
  });

  BookLoaded copyWith({required int newDisplayedCount}) {
    return BookLoaded(
      books: books,
      displayedBooksCount: newDisplayedCount,
    );
  }

  @override
  List<Object> get props => [books, displayedBooksCount];
}


class BookError extends BookState {}

