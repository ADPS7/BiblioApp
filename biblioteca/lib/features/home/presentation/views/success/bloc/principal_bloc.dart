import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/services/http_service.dart';
import 'principal_state.dart';
import 'principal_event.dart';

class PrincipalBloc extends Bloc<PrincipalEvent, PrincipalState> {
  final HttpService _http = HttpService();

  PrincipalBloc() : super(InitialPrincipalState()) {
    on<SearchBooksEvent>(_onSearchBooks);
  }

  Future<void>_onSearchBooks(SearchBooksEvent event, Emitter<PrincipalState> emit) async {
    emit(LoadingPrincipalState());

    try {
      final result = await _http.searchBooks(event.title, event.author);
      final books = result[0];
      final totalResults = result[1];

      if (books == null || books.isEmpty) {
        emit(EmptyPrincipalState());
        return;
      }

      emit(SuccessPrincipalState(books: books, totalResults: totalResults));
    } catch (e) {
      emit(ErrorPrincipalState(message: "Error al conectar a la API: $e"));
    }
  }
}
