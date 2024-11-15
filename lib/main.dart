import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chopper_service.dart';
import 'chopper_data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PostService.create(),
      dispose: (_, PostService service) => service.client.dispose(),
      child: MaterialApp(
        title: 'Networking with HTTP and Chopper',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Networking Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              List<dynamic> _posts = [];
              bool _isLoading = true;

            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HttpDataScreen()),
            ),
            child: const Text('HTTP Data'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ChopperDataScreen()),
            ),
            child: const Text('Chopper Data'),
          ),
        ],
      ),
    );
  }
}
