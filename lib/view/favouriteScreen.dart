import 'package:flutter/material.dart';
import 'package:quotes_generator/data/models/Quotes_Model.dart';

class FavoritePage extends StatelessWidget {
  final String? quote;

  const FavoritePage({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Quotes'),
      ),
      body: Card(
        color: Color(0xffFCE8D5),
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child:
                Text(
                  quote ?? ''.toString(),
                  style: TextStyle(fontSize: 18.0),
                ),



        ),
      ),
    );
  }
}
