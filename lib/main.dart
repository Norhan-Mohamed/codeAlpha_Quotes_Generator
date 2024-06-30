import 'package:flutter/material.dart';
import 'package:quotes_generator/view/qoutesScreen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/quote': (context) => QuotePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff53C7F0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.transparent,
                height: 150,
                width: 200,
                child: Image.asset("assets/image.png",)),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Hello, prepare to be inspired!',
                style: TextStyle(fontSize: 25.0,color: Color(0xffFCE8D5)),
              ),
            ),
            SizedBox(height: 20.0),
             ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/quote');
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Generate Quote',style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
