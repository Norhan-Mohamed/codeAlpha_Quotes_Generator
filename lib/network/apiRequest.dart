import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quotes_generator/data/models/Quotes_Model.dart';

import '../data/models/Quotes_Model.dart';

class Api {
  Future<List<QuotesModel>> fetchData() async {
    final Uri uri = Uri.https(
      "random-quote-generator2.p.rapidapi.com",
      "/randomQuote",
    );

    final response = await http.get(
      uri,
      headers: {
        'x-rapidapi-host': 'random-quote-generator2.p.rapidapi.com',
        'x-rapidapi-key': '91d5486736msh4da31749cd7f79ap1ec77ejsne9a732c8faea',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      // Parse JSON response array
      List<dynamic> responseBody = jsonDecode(response.body);
      print(responseBody); // Optional: Print to see the structure

      // Assuming your quotes model class is named Quotes
      List<QuotesModel> quotesList = responseBody.map((json) => QuotesModel.fromJson(json)).toList();
      return quotesList;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
