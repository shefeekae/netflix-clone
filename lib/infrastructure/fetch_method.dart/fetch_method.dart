import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/Domain/Downloads/Model/downloads_model.dart';
import 'package:netflix/core/api_constants.dart';

Future<List<Result>> fetchPost() async {
  final response = await http.get(Uri.parse(ApiEndPoint.download));

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);
    Iterable list = parsed["results"];
    return list.map<Result>((json) => Result.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}
