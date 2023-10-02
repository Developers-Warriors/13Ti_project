import 'package:abstracts/core/ui/_ui.dart';
import 'package:abstracts/feature/_feature.dart';
import 'package:abstracts/feature/dio_settings/data/models/post_model.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PostLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is PostSuccess) {
          List<PostModel> posts = state.posts;
          // return buildPostListView(state.posts);
          return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                PostModel post = posts[index];
                return ListTile(
                  title: Text(
                    post.title ?? '404',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  subtitle: Text(posts[index].body ?? '404'),
                  trailing: Text(post.userId.toString()),
                );
              });
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  fetchData(BuildContext context) {
    BlocProvider.of<PostCubit>(context).fetchPost();
  }
}
