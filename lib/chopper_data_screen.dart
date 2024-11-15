import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chopper_service.dart';

class ChopperDataScreen extends StatelessWidget {
  const ChopperDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var postService = Provider.of<PostService>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Chopper Data')),
      body: FutureBuilder(
        future: postService.getPosts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final List<dynamic> posts = snapshot.data.body;
          return ListView.builder(
          postService = Provider.of<PostService>(context);
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
