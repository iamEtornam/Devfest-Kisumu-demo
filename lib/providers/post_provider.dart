import 'package:devfest_kisumu_demo/models/post.dart';
import 'package:devfest_kisumu_demo/repositories/post_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostProvider extends StateNotifier<List<Post>> {
  PostProvider(this.repository) : super([]);

  final PostRepositoryImpl repository;

  Future<void> getPosts() async {
    final posts = await repository.getPostService();
    // state = [...state, ...posts];
    state = posts;
  }
}
