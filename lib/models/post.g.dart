// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['id'] as String,
      json['text'] as String,
      json['image'] as String,
      json['likes'] as int,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      json['publishDate'] as String,
      User.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'image': instance.image,
      'likes': instance.likes,
      'tags': instance.tags,
      'publishDate': instance.publishDate,
      'owner': instance.owner,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String,
      json['title'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['picture'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'picture': instance.picture,
    };
