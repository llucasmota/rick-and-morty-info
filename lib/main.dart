import 'package:flutter/material.dart';
import 'package:rick_morty_app/components/character_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: [],
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
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(24),
                          isDense: true,
                          hintText: 'Search characters',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: const [CharacterComponent()],
            )
          ]),
        ),
      ),
    );
  }
}
