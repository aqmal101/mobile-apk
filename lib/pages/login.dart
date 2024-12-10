import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/base_page.dart';
import 'package:getwidget/getwidget.dart';
import '../providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
                controller: _usernameController,
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
            GFButton(
              fullWidthButton: true,
              shape: GFButtonShape.pills,
              onPressed: () async {
                final username = _usernameController.text;
                final password = _passwordController.text;

                try {
                  await Provider.of<AuthProvider>(context, listen: false)
                      .login(username, password);

                  if (Provider.of<AuthProvider>(context, listen: false)
                      .isAuthenticated) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Login failed: $error'),
                  ));
                }
              },
              // {

              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const BasePage()),
              //   );
              // },

              color: Colors.orange,
              size: GFSize.LARGE,
              text: "Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}
