import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.lime[500],
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: const Text('NIM : 220113002'),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: const Text('Nama : Aqmal Miftahul Husna'),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: const Text('Prodi : Teknologi Informasi'),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Image.network(
                'https://raw.githubusercontent.com/aqmal101/background-image/main/apple-pie-1584258_1920.jpg',
                fit: BoxFit.cover,
                width: 300,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
