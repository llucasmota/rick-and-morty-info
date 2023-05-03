import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rick_morty_app/model/character.dart';
import 'package:rick_morty_app/model/characters_list.dart';

class CharacterComponent extends StatelessWidget {
  CharacterComponent({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color.fromRGBO(172, 123, 100, 1)),
      padding: const EdgeInsets.only(bottom: 32, top: 32, left: 16, right: 16),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '# ${character.id}',
                style: TextStyle(
                    color: Color.fromRGBO(23, 23, 27, 0.5), fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('${character.name}',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1), fontSize: 18)),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Chip(
                      label: Text('${character.status}'),
                      backgroundColor: character.status == 'Alive'
                          ? Colors.greenAccent[400]
                          : character.status == 'Dead'
                              ? Colors.red[400]
                              : Colors.white),
                  const SizedBox(width: 4.0),
                  Chip(
                      label: Text('${character.species}'),
                      backgroundColor: Color.fromRGBO(172, 123, 100, 0.6))
                ],
              )
            ],
          ),
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: FadeInImage(
                  placeholderFit: BoxFit.fitHeight,
                  height: 100,
                  width: 100,
                  image: NetworkImage(character.image),
                  placeholder:
                      const AssetImage('assets/images/fallback_rick.png'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
