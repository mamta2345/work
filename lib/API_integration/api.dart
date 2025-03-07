import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:remote/API_integration/api_model.dart';

class ApiService {
  static const String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  static Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
