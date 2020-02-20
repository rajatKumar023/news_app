// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headlines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Headlines _$HeadlinesFromJson(Map<String, dynamic> json) {
  return Headlines()
    ..author = json['author'] as String
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..url = json['url'] as String
    ..urlToImage = json['urlToImage'] as String
    ..publishedAt = json['publishedAt'] as String
    ..content = json['content'] as String;
}

Map<String, dynamic> _$HeadlinesToJson(Headlines instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Headlines on _Headlines, Store {
  final _$authorAtom = Atom(name: '_Headlines.author');

  @override
  String get author {
    _$authorAtom.context.enforceReadPolicy(_$authorAtom);
    _$authorAtom.reportObserved();
    return super.author;
  }

  @override
  set author(String value) {
    _$authorAtom.context.conditionallyRunInAction(() {
      super.author = value;
      _$authorAtom.reportChanged();
    }, _$authorAtom, name: '${_$authorAtom.name}_set');
  }

  final _$titleAtom = Atom(name: '_Headlines.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_Headlines.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$urlAtom = Atom(name: '_Headlines.url');

  @override
  String get url {
    _$urlAtom.context.enforceReadPolicy(_$urlAtom);
    _$urlAtom.reportObserved();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.context.conditionallyRunInAction(() {
      super.url = value;
      _$urlAtom.reportChanged();
    }, _$urlAtom, name: '${_$urlAtom.name}_set');
  }

  final _$urlToImageAtom = Atom(name: '_Headlines.urlToImage');

  @override
  String get urlToImage {
    _$urlToImageAtom.context.enforceReadPolicy(_$urlToImageAtom);
    _$urlToImageAtom.reportObserved();
    return super.urlToImage;
  }

  @override
  set urlToImage(String value) {
    _$urlToImageAtom.context.conditionallyRunInAction(() {
      super.urlToImage = value;
      _$urlToImageAtom.reportChanged();
    }, _$urlToImageAtom, name: '${_$urlToImageAtom.name}_set');
  }

  final _$publishedAtAtom = Atom(name: '_Headlines.publishedAt');

  @override
  String get publishedAt {
    _$publishedAtAtom.context.enforceReadPolicy(_$publishedAtAtom);
    _$publishedAtAtom.reportObserved();
    return super.publishedAt;
  }

  @override
  set publishedAt(String value) {
    _$publishedAtAtom.context.conditionallyRunInAction(() {
      super.publishedAt = value;
      _$publishedAtAtom.reportChanged();
    }, _$publishedAtAtom, name: '${_$publishedAtAtom.name}_set');
  }

  final _$contentAtom = Atom(name: '_Headlines.content');

  @override
  String get content {
    _$contentAtom.context.enforceReadPolicy(_$contentAtom);
    _$contentAtom.reportObserved();
    return super.content;
  }

  @override
  set content(String value) {
    _$contentAtom.context.conditionallyRunInAction(() {
      super.content = value;
      _$contentAtom.reportChanged();
    }, _$contentAtom, name: '${_$contentAtom.name}_set');
  }
}
