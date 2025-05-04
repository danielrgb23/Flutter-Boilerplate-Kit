import 'package:config_flutter/repository/abstract.repository.dart';

class GetExemple extends AbstractRepository {
  Future<List<dynamic>> fetchPosts() async {
    final response =
        await genericGet('https://jsonplaceholder.typicode.com/posts');
    return response;
  }
}
