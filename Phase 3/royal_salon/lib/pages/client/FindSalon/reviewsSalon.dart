import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Column(
        children: [
          Container(color: Colors.amber[50], child: Text('Reviews list')),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.black54,
            child: Column(
              children: [
                Text('Ratings'),
                Row(
                  children: [
                    Text('Categories'),
                  ],
                ),
                Row(
                  children: [
                    Text('Hygiene'),
                    StarRow(),
                  ],
                ),
                Row(
                  children: [Text('HairStyle'), StarRow()],
                ),
                Row(
                  children: [Text('Categories'), StarRow()],
                ),
                Row(
                  children: [Text('Categories'), StarRow()],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StarRow extends StatelessWidget {
  const StarRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.star),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.star),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.star),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.star),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.star),
        ),
      ],
    );
  }
}

class NoReviews extends StatelessWidget {
  const NoReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Center(
        child: Text('No Reviews Yet...'),
      ),
    );
  }
}
