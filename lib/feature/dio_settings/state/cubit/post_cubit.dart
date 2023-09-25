// ignore_for_file: deprecated_member_use

import 'package:abstracts/feature/dio_settings/data/models/post_model.dart';
import 'package:abstracts/feature/dio_settings/data/repo/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial()) {
    //* Можно вызвать BlocProvider здесь не вызывая до того будет соибратся приложение (return)
    // fetchPost();
  }

  void fetchPost() async {
    try {
      List<PostModel> posts = await postRepo.fetchPost();
      emit(PostSuccess(posts));
    } on DioException catch (e) {
      // if (e.error == DioErrorType.unknown) {
      //   emit(PostError('Проврка инета'));
      // } 
      emit(PostError(e.type.toString()));
    }
  }

  PostRepo postRepo = PostRepo();
}
