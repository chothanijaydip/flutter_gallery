import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClient {
  final String _uri;
  final String _apiKey;

  GraphQLClient({required String uri, required String apiKey})
      : _uri = uri,
        _apiKey = apiKey;

  // Future<QueryResult> query(String query) async {
  //   final response = await http.post(Uri.parse(_uri), headers: {
  //     'Authorization': 'Bearer $_apiKey',
  //     'Content-Type': 'application/json',
  //   }, body: jsonEncode({'query': query}));
  //
  //   if (response.statusCode == 200) {
  //     return QueryResult.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to query GraphQL API');
  //   }
  // }
}