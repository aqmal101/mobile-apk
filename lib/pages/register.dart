import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/base_page.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Information'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Username: ${_usernameController.text}'),
                Text('Email: ${_emailController.text}'),
                Text('Password: ${_passwordController.text}'),
                Text('Confirm Password: ${_confirmPasswordController.text}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        );
      },
    );
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
                alignment: Alignment.center,
                child: Text(
                  'SIGN UP',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Create your account',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            _buildTextField(
              controller: _usernameController,
              label: 'Username',
              icon: Icons.account_box,
            ),
            _buildTextField(
              controller: _emailController,
              label: 'Email',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            _buildTextField(
              controller: _passwordController,
              label: 'Password',
              icon: Icons.lock,
              isPassword: true,
            ),
            _buildTextField(
              controller: _confirmPasswordController,
              label: 'Confirm Password',
              icon: Icons.password,
              isPassword: true,
            ),
            GFButton(
              fullWidthButton: true,
              shape: GFButtonShape.pills,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BasePage()),
                );
              },
              size: GFSize.LARGE,
              text: "Sign Up",
            ),
            Container(
              margin: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'OR',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            GFButton(
              fullWidthButton: true,
              shape: GFButtonShape.pills,
              type: GFButtonType.solid,
              color: GFColors.WHITE,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BasePage()),
                );
              },
              size: GFSize.LARGE,
              text: "Sign in with Google",
              textColor: GFColors.INFO,
              icon: SvgPicture.network(
                'https://raw.githubusercontent.com/aqmal101/background-image/7a1f3bfa79be5b94763cca52969f9bd50fcf0aac/google.svg',
                height: 24.0,
                width: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: 'Enter your $label',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
