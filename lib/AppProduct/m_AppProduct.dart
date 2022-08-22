import 'package:flutter/material.dart';

class AppGG extends StatefulWidget {
  const AppGG({Key? key}) : super(key: key);

  @override
  State<AppGG> createState() => _AppGGState();
}

class _AppGGState extends State<AppGG> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Layout'),
            ),
            body: ListView(children: [
              Image.asset(
                'lib/assets/img/pic_1.jpg',
                width: 600,
                height: 335,
              ),
              title,
              ButtonSelection,
              _decription
            ])));
  }

  Widget ButtonSelection = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _BuildBtton(Colors.green, Icons.call, 'Call'),
      _BuildBtton(Colors.green, Icons.share, 'Share'),
      _BuildBtton(Colors.green, Icons.near_me, 'Route'),
    ],
  );
  Widget title = Container(
    padding: EdgeInsets.all(20),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(color: Colors.black54),
            )
          ]),
        ),
        // IconButton(
        //     onPressed: toggleFavorite,
        //     icon: _isFavorited
        //         ? Icon(Icons.star_border)
        //         : Icon(
        //             Icons.star,
        //             color: Colors.red,
        //           )),
        FavoriteState(),
      ],
    ),
  );
  static Column _BuildBtton(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: color),
          ),
        )
      ],
    );
  }

  final Widget _decription = Padding(
    padding: EdgeInsets.all(9),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );
}

class FavoriteState extends StatefulWidget {
  const FavoriteState({Key? key}) : super(key: key);

  @override
  State<FavoriteState> createState() => _FavoriteStateState();
}

bool _isFavorited = true;
int _totalFavorite = 0;

class _FavoriteStateState extends State<FavoriteState> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        icon: (_isFavorited
            ? Icon(Icons.star_border)
            : Icon(
                Icons.star,
              )),
        color: Colors.red[500],
        onPressed: _toggleFavorite,
      ),
      Text('$_totalFavorite')
    ]);
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _totalFavorite = _totalFavorite + 1;
        _isFavorited = false;
      } else {
        _totalFavorite = _totalFavorite - 1;
        _isFavorited = true;
      }
    });
  }
}
