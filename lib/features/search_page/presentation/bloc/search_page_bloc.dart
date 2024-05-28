import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  SearchPageBloc() : super(SearchPageInitial()) {
    on<SearchPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
