import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_morty_app/model/character.dart';
import 'package:rick_morty_app/model/info.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty_app/utils/contants.dart';

part 'characters_list.g.dart';

@JsonSerializable()
class CharactersList with ChangeNotifier {
  Info? info;
  List<Character> results;

  CharactersList([this.results = const []]);

  factory CharactersList.fromJson(Map<String, dynamic> json) =>
      _$CharactersListFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersListToJson(this);

  Future<void> loadCharacters() async {
    final response = await http.get(Uri.parse(Constants.CHARACTERS));
    final characters = CharactersList.fromJson(jsonDecode(response.body));
    results = characters.results;
    info = characters.info;
    print('info-characters: ${characters.info?.count}');
    print('character-result: ${response.body}');
  }
}
