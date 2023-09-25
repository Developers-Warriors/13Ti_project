part of 'rick_and_morty_bloc.dart';

@immutable
sealed class RickAndMortyEvent {}

class GetRickAndMortyEvent extends RickAndMortyEvent {}

class AnimeEvent extends RickAndMortyEvent {
  AnimeEvent({required this.amout});
  final int amout;
}
