import 'package:abstracts/feature/testings_api/data/repo/_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/_models.dart';

part 'json_phd_b_event.dart';
part 'json_phd_b_state.dart';

class JsonPhdBBloc extends Bloc<JsonPhdBEvent, JsonPhdBState> {
  JsonPhdBBloc({required this.repo}) : super(JsonPhdBInitial()) {
    on<GetJsonPhdBEvent>((event, emit) async {
      try {
        emit(JsonPhdBError());

        final response = await repo.fetchPost();
        emit(JsonPhdBSuccess(moldeList: response));
      } catch (e) {
        emit(JsonPhdBError());
      }
    });
  }
  final JsonPHDRepo repo;
}
