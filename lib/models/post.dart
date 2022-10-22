import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final String id;
  final String text;
  final String image;
  final int likes;
  @JsonKey(defaultValue: [])
  final List<String> tags;
  final String publishDate;
  final User owner;

  Post(this.id, this.text, this.image, this.likes, this.tags, this.publishDate, this.owner);

  factory Post.fromJson(Map<String, dynamic> datamap) => _$PostFromJson(datamap);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String picture;

  User(this.id, this.title, this.firstName, this.lastName, this.picture);

  factory User.fromJson(Map<String, dynamic> datamap) => _$UserFromJson(datamap);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
