import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'source.g.dart';

@JsonSerializable()
class Source extends _Source with _$Source {
  static Source fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

  static Map<String, dynamic> toJson(Source source) =>
      _$SourceToJson(source);
}

abstract class _Source with Store {
  @observable
  @JsonKey(nullable: true)
  String id;

  @observable
  String name;
}
