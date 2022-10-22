import 'package:devfest_kisumu_demo/models/post.dart';
import 'package:devfest_kisumu_demo/repositories/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements PostRepositoryImpl {}

// late MockPostRepository? mockPostRepository;
void main() {
  //setupall
  //teardownall
  //setup
  //teardown
  // setUpAll(() {
  //   mockPostRepository = MockPostRepository();
  // });

  // tearDownAll(() {
  //   mockPostRepository = null;
  // });

  ///test to get all posts
  test('get all post should work', () async {
    final mockPostRepo = MockPostRepository();
    final user = User.fromJson({
      'id': '',
      'title': '',
      'firstName': '',
      'lastName': '',
      'picture': '',
    });

    final post = Post.fromJson({
      'id': '1',
      'text': '',
      'image': '',
      'likes': 12,
      'tags': [],
      'publishDate': DateTime.now().toIso8601String(),
      'owner': user.toJson()
    });

    when(() => mockPostRepo.getPostService()).thenAnswer((_) => Future.value([
          post,
          post,
          post,
          post,
        ]));

    final posts = await mockPostRepo.getPostService();

    expect(posts.isEmpty, false);
    expect(posts.length, 4);
    expect(posts, isA<List<Post>>());
  });
}
