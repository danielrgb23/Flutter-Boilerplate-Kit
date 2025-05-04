import 'package:flutter/material.dart';
import 'package:config_flutter/common/mixins/l10n_mixin.dart';
import 'package:config_flutter/services/get_exemple.services.dart';

class Teste extends StatefulWidget {
  static const String PATH = '/';

  const Teste({Key? key}) : super(key: key);

  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> with L10n {
  final repo = GetExemple();
  late Future<List<dynamic>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = repo.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo GET')),
      body: FutureBuilder<List<dynamic>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum dado encontrado.'));
          }

          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post['title']),
                subtitle: Text(post['body']),
              );
            },
          );
        },
      ),
    );
  }
}
