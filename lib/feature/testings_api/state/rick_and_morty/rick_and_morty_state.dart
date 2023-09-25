part of 'rick_and_morty_bloc.dart';

@immutable
sealed class RickAndMortyState {}

final class RickAndMortyInitial extends RickAndMortyState {}

final class RickAndMortyLoading extends RickAndMortyState {}

final class RickAndMortySuccess extends RickAndMortyState {
  RickAndMortySuccess({required this.model});
  final RickAndMorty model;
}

final class AnimeSuccess extends RickAndMortyState {
  AnimeSuccess({required this.model});
  final List<AmimeModels> model;
}

final class RickAndMortyError extends RickAndMortyState {}
