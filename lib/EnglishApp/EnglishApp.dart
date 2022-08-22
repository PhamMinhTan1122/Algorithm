import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

final wordPair = WordPair.random();

class EnglishApp extends StatelessWidget {
  const EnglishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        )),
        home: appState(),
        title: 'English Appliacation PMT');
  }
}

class appState extends StatefulWidget {
  const appState({Key? key}) : super(key: key);

  @override
  State<appState> createState() => _appStateState();
}

class _appStateState extends State<appState> {
  final _suggestion = <WordPair>[];
  final _saved = <WordPair>{};
  final _bigFont = const TextStyle(fontSize: 19);
  @override
  Widget build(BuildContext context) {
    void _pushSaved() {
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
        final tiles = _saved.map((pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _bigFont,
            ),
          );
        });
        final divided = tiles.isNotEmpty
            ? ListTile.divideTiles(
                context: context,
                tiles: tiles,
              ).toList()
            : <Widget>[];
        return Scaffold(
          appBar: AppBar(
            title: const Text('Saved Suggestion'),
          ),
          body: ListView(
            children: divided,
          ),
        );
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('English Application PMT'),
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: const Icon(Icons.list),
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(18),
          itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();
            final index = i ~/ 2;
            if (index >= _suggestion.length) {
              _suggestion.addAll(generateWordPairs().take(4));
            }
            final _arealySaved = _saved.contains(_suggestion[index]);
            return ListTile(
              title: Text(
                _suggestion[index].asPascalCase,
                style: _bigFont,
              ),
              trailing: Icon(
                _arealySaved ? Icons.favorite : Icons.favorite_border,
                color: _arealySaved ? Colors.red : null,
                semanticLabel: _arealySaved ? 'Remove from saved' : 'Saved',
              ),
              onTap: () {
                setState(() {
                  if (_arealySaved) {
                    _saved.remove(_suggestion[index]);
                  } else {
                    _saved.add(_suggestion[index]);
                  }
                });
              },
            );
          }),
    );
  }
}
