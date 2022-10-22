import 'package:devfest_kisumu_demo/models/post.dart';
import 'package:devfest_kisumu_demo/repositories/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PostMockRepository extends Mock implements PostRepository {}

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
}
