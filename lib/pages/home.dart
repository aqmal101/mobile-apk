import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://raw.githubusercontent.com/aqmal101/background-image/7a1f3bfa79be5b94763cca52969f9bd50fcf0aac/%CA%9A%C9%9E.jpeg'), // Gambar profil
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Rereregulus',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Fungsi logout
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 4, // 2 kolom dalam grid
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          children: <Widget>[
            _buildCard(
              icon: Icons.health_and_safety,
              title: 'Health',
              color: Colors.redAccent,
            ),
            _buildCard(
              icon: Icons.message,
              title: 'Messages',
              color: Colors.orange,
            ),
            _buildCard(
              icon: Icons.analytics,
              title: 'Reports',
              color: Colors.blue,
            ),
            _buildCard(
              icon: Icons.settings,
              title: 'Settings',
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat Card widget
  Widget _buildCard({IconData? icon, String? title, Color? color}) => Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            // Aksi saat card ditekan
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 10),
              Text(
                title!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}
