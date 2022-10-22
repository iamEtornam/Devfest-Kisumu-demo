import 'dart:convert';

import 'package:devfest_kisumu_demo/config/config.dart';
import 'package:devfest_kisumu_demo/models/post.dart';
import 'package:http/http.dart';

abstract class PostRepository {
  Future<List<Post>> getPostService();
}

class PostRepositoryImpl implements PostRepository {
  @override
  Future<List<Post>> getPostService() async {
    List<Post> posts = [];
    try {
      /// get api key from https://dummyapi.io/docs
      final res = await get(Uri.parse(Config.apiUrl),
          headers: {'app-id': const String.fromEnvironment('API_KEY')});
      if (res.statusCode == 200) {
        final body = json.decode(res.body);
        posts = List<Post>.from(body['data'].map((model) => Post.fromJson(model)));
      } else {
        posts = [];
      }
      return posts;
    } catch (e) {
      return posts;
    }
  }
}
