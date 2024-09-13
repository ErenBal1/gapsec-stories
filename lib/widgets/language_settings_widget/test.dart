import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpExample extends StatefulWidget {
  const HttpExample({super.key});

  @override
  _HttpExampleState createState() => _HttpExampleState();
}

class _HttpExampleState extends State<HttpExample> {
  String baseUrl =
      "http://cvgezgini.com/api/youtube-search/?search_query=şakiro";

  Future<String> fetchResponse() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Fail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ornek'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final users = await fetchResponse();
              print(users); // Konsola yazdır
            },
            child: const Text('Run'),
          ),
        ],
      ),
    );
  }
}
