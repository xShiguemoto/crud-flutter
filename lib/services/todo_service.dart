import 'dart:convert';

import 'package:http/http.dart' as http;

/// All todo api call will be here
class TodoService {
  static Future<bool> deleteById(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    return response.statusCode == 200;
  }

  static Future<List?> fetchTodos() async {
    print('Chamando fetchData...');
    final url = 'https://lucastroo.com/product-crud/public/api/product';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = json as List;
      print(result);
      return result;
    } else {
      return null;
    }
  }

  static Future<bool> UpdateTodo(String id, Map body) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode == 200;
  }

  static Future<bool> AddTodo(Map body) async {
    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode == 201;
  }
}
