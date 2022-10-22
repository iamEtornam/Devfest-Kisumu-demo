import 'package:devfest_kisumu_demo/models/post.dart';
import 'package:devfest_kisumu_demo/repositories/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PostMockRepository extends Mock implements PostRepositoryImpl {}

late PostMockRepository? postMockRepository;
void main() {
  setUpAll(() {
    postMockRepository = PostMockRepository();
  });

  tearDownAll(() {
    postMockRepository = null;
  });

  test('get posts should work', () async {
    when(() => postMockRepository!.getPostService()).thenAnswer((_) => Future.value([
          Post('1', 'some text here', 'image url', 2, [], '22-10-2022',
              User('1', 'Mr', 'Etornam', 'Sunu', 'pic here'))
        ]));

    final posts = await postMockRepository!.getPostService();

    expect(posts.isNotEmpty, true);

    expect(posts.length, 1);

    expect(posts, isA<List<Post>>());
  });

  test('get all post should work', () async {
    when(() => postMockRepository!.getPostService()).thenAnswer((_) {
      final user = User.fromJson({
        'id': '',
        'title': '',
        'firstName': '',
        'lastName': '',
        'picture': '',
      });
      final post = Post.fromJson({
        'id': '',
        'text': '',
        'image': '',
        'likes': 10,
        'link': '',
        'tags': [],
        'publishDate': DateTime.now().toIso8601String(),
        'owner': user.toJson(),
      });
      return Future.value([
        post,
        post,
        post,
      ]);
    });

    final posts = await postMockRepository!.getPostService();

    expect(posts.isNotEmpty, true);

    expect(posts.length, 3);

    expect(posts, isA<List<Post>>());
  });
}
