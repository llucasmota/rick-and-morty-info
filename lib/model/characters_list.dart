import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_morty_app/model/character.dart';
import 'package:rick_morty_app/model/info.dart';
import 'package:rick_morty_app/model/character.dart';
part 'characters_list.g.dart';

@JsonSerializable()
class CharactersList with ChangeNotifier {
  final Info info;
  final List<Character> results;

  CharactersList({required this.info, required this.results});

  factory CharactersList.fromJson(Map<String, dynamic> json) =>
      _$CharactersListFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersListToJson(this);
}
