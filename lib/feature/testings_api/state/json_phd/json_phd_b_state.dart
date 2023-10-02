part of 'json_phd_b_bloc.dart';

@immutable
sealed class JsonPhdBState {}

final class JsonPhdBInitial extends JsonPhdBState {}

final class JsonPhdBLoading extends JsonPhdBState {}

final class JsonPhdBSuccess extends JsonPhdBState {
  JsonPhdBSuccess({required this.moldeList});
  final List<JsonPHDModels> moldeList;
}

final class JsonPhdBError extends JsonPhdBState {}
