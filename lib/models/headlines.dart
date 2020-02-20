import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'headlines.g.dart';

@JsonSerializable()
class Headlines extends _Headlines with _$Headlines {
  static Headlines fromJson(Map<String, dynamic> json) =>
      _$HeadlinesFromJson(json);

  static Map<String, dynamic> toJson(Headlines headlines) =>
      _$HeadlinesToJson(headlines);
}

abstract class _Headlines with Store {
  @observable
  @JsonKey(nullable: true)
  String author;

  @observable
  String title;

  @observable
  String description;

  @observable
  String url;

  @observable
  String urlToImage;

  @observable
  String publishedAt;

  @observable
  String content;
}
