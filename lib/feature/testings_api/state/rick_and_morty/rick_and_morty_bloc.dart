import 'package:abstracts/feature/testings_api/data/_data.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rick_and_morty_event.dart';
part 'rick_and_morty_state.dart';

class RickAndMortyBloc extends Bloc<RickAndMortyEvent, RickAndMortyState> {
  RickAndMortyBloc({required this.repo}) : super(RickAndMortyInitial()) {
    on<GetRickAndMortyEvent>((event, emit) async {
      try {
        emit(RickAndMortyLoading());
        final response = await repo.getRickAndMorty();
        emit(RickAndMortySuccess(model: response));
      } catch (e) {
        emit(RickAndMortyError());
      }
    });
    on<AnimeEvent>((event, emit) async {
      try {
        final response = await repo.getAnime(amount: event.amout);
        emit(AnimeSuccess(model: response));
      } catch (e) {
        emit(RickAndMortyError());
      }
    });
  }
  final RickRepo repo;
}
