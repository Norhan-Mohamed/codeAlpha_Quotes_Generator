import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_generator/data/models/Quotes_Model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../network/apiRequest.dart';
import 'favouriteScreen.dart';
import 'media_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuotePage extends StatelessWidget {


  void fetchDataExample() async {
    Api api = Api();
    try {
      List<QuotesModel> quotesList = await api.fetchData();
      quotesList.forEach((quotes) {
        print('Quote: ${quotes.quote}');
        print('Author: ${quotes.author}');
        print('Tags: ${quotes.tags}');
        if (quotes.iId != null) {
          print('Id: ${quotes.iId!.oid}');
        }
      });
      // Handle the fetched data as needed
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff53C7F0),
      appBar: AppBar(
        backgroundColor: Color(0xff53C7F0),
        title: Text('Quote',style: TextStyle(
          color: Color(0xffFCE8D5),fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Color(0xffFCE8D5),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<QuotesModel>>(
                future: Api().fetchData(),
                builder: (context, snapshot) {
    if (snapshot.hasError) {
    print(snapshot.error.toString());
    }
                  if (snapshot.hasData)
                    { return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text("#Quoteoftheday",textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w400,color: Colors.black54),),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*5/6,
                          height: MediaQuery.of(context).size.height/2,
                          decoration: BoxDecoration(
                            color: Color(0xffFCE8D5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                snapshot.data!.first.quote.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 20.0),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFCE8D5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.favorite),
                        color: Colors.black,
                        onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavoritePage(quote: snapshot.data!.first.quote,),
                              ),
                            );

                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFCE8D5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.share),
                        color: Colors.black,
                        onPressed: () {
                          _showShareOptions(context);
                        },
                      ),
                    ),

                  ],
                  )
                      ],
                    );}
                  return  Center(
      child: CircularProgressIndicator(
        color:Colors.amber,
      ),
    );

                  }
       ),
      ]),

        ),
      );

  }
}
void _showShareOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("share this quotes",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidgets.socialButtonCircle(
                      facebookColor, FontAwesomeIcons.facebookF,
                      iconColor: Colors.white, onTap: () {
                    Fluttertoast.showToast(msg: 'I am circle facebook');
                  }),
                  CustomWidgets.socialButtonCircle(
                      googleColor, FontAwesomeIcons.googlePlusG,
                      iconColor: Colors.white, onTap: () {
                    Fluttertoast.showToast(msg: 'I am circle google');
                  }),
                  CustomWidgets.socialButtonCircle(
                      whatsappColor, FontAwesomeIcons.whatsapp,
                      iconColor: Colors.white, onTap: () {
                    Fluttertoast.showToast(msg: 'I am circle whatsapp');
                  }),
                ],
              ),
Text("Page Link",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500,),),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                    "https://www.figma.com/community/file/1379126550913657778/daily-ui-10-social-share-screen?searchSessionId=ly14s54x-ybbvjeygk29",
                maxLines: 1,

                  overflow: TextOverflow.ellipsis,
                ),
              )


            ],
          ),
        ),
      );
    },
  );
}