import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_app/model/characters_list.dart';
import 'package:rick_morty_app/screens/character_screen.dart';
import 'package:rick_morty_app/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CharactersList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {AppRoutes.HOME: (context) => const CharacterScreen()},
      ),
    );
  }
}
