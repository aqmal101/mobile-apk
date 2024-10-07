import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _isPasswordVisible = false;

  void _showData() {
    String username = _userNameController.text;
    String password = _passwordController.text;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Data Akun'),
            content: Text('Username: $username\nPassword: $password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4.0),
              child: Align(
                alignment: Alignment.center, // Mengatur align ke tengah
                child: Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.center, // Mengatur align ke tengah
                child: Text(
                  'Enter your credential to login',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: _userNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Masukkan username Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  // prefixIcon: const Icon(Icons.account_box),
                ),
                onChanged: (text) {
                  // Aksi yang dijalankan ketika teks berubah
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 22.0, top: 11.0),
              child: TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukkan sandi Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  // prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                onChanged: (text) {
                  // Aksi yang dijalankan ketika teks berubah
                },
              ),
            ),
            SizedBox(
              height: 48.0, // Adjust the height as needed
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Background color
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        50.0), // Set radius for rounded corners
                  ),
                ),
                onPressed: () {
                  _showData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // Change font weight
                    fontSize: 18.0, // Change font size
                    fontFamily: 'Roboto', // Change font family
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
