import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/components/character_component.dart';
import 'package:rick_morty_app/model/characters_list.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty_app/utils/contants.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading = true;
    });
    Provider.of<CharactersList>(context, listen: false)
        .loadCharacters()
        .then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  Future<void> next() async {
    setState(() {
      loading = true;
    });
    Provider.of<CharactersList>(context, listen: false).forward().then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  Future<void> prev() async {
    setState(() {
      loading = true;
    });
    Provider.of<CharactersList>(context, listen: false).prev().then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharactersList>(context, listen: true).results;

    return Scaffold(
      appBar: AppBar(
        title: Text('Rick And Morty'),
        actions: [
          OutlinedButton.icon(
            onPressed: prev,
            icon: Icon(Icons.arrow_back, color: Colors.indigo),
            label: Text(''),
          ),
          OutlinedButton.icon(
            onPressed: next,
            icon: Icon(Icons.arrow_forward, color: Colors.indigo),
            label: Text(''),
          )
        ],
        backgroundColor: const Color.fromRGBO(151, 206, 76, 0.9),
        elevation: 10,
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.8),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage('assets/images/fallback_rick.png'),
                fit: BoxFit.contain,
                opacity: 0.2)),
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10),
                alignment: Alignment.center,
                child: const Text(
                  'Rick and Morty',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                child: const Text(
                  'Rick and Morty Finder book check here the status of your favorite character',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(242, 242, 242, 0.6)),
                      child: TextField(
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(24),
                            isDense: true,
                            hintText: 'Search characters',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: prev,
                    child: Text(
                      'Previous Page',
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        padding: EdgeInsets.all(10),
                        fixedSize: Size.fromWidth(150)),
                  ),
                  ElevatedButton(
                    onPressed: next,
                    child: Text(
                      'Next Page',
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        padding: EdgeInsets.all(10),
                        fixedSize: Size.fromWidth(150)),
                  )
                ],
              ),
              if (loading) CircularProgressIndicator(),
              if (provider.isNotEmpty)
                Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 550,
                    child: ListView.builder(
                      itemCount: provider.length,
                      itemBuilder: (context, index) {
                        return CharacterComponent(character: provider[index]);
                      },
                    ))
            ]),
          ),
        ),
      ),
    );
  }
}
