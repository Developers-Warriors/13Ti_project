part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostSuccess extends PostState {
  final List<PostModel> posts;
  PostSuccess(this.posts);
}

final class PostError extends PostState {
  final String error;
  PostError(this.error);
}
