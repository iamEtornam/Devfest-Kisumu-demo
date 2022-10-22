import 'package:devfest_kisumu_demo/models/post.dart';
import 'package:devfest_kisumu_demo/providers/post_provider.dart';
import 'package:devfest_kisumu_demo/repositories/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final repository = PostRepositoryImpl();
final postProvider = StateNotifierProvider<PostProvider, List<Post>>((ref) {
  return PostProvider(repository);
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(postProvider.notifier).getPosts();
    List<Post> posts = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Posts'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    post.image,
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    post.text,
                    maxLines: 3,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.thumb_up),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(post.likes.toString())
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (__, _) => const Divider(),
          itemCount: posts.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(postProvider.notifier).getPosts(),
        tooltip: 'reload',
        child: const Icon(Icons.restore_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
