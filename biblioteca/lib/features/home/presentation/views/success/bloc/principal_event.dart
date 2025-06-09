
abstract class PrincipalEvent {}

class SearchBooksEvent extends PrincipalEvent {
  final String title;
  final String author;

  SearchBooksEvent({required this.title, required this.author});
}
