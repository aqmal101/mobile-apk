import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Color _backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _loadBackgroundColor();
  }

  // Memuat warna latar belakang dari SharedPreferences
  Future<void> _loadBackgroundColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? colorValue = prefs.getInt('background_color');
    if (colorValue != null) {
      setState(() {
        _backgroundColor = Color(colorValue);
      });
    }
  }

  // Menyimpan warna latar belakang ke SharedPreferences
  Future<void> _saveBackgroundColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('background_color', color.value);
  }

  // Mengganti warna latar belakang
  void _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
    _saveBackgroundColor(color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: const Text("Change Background Color"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pilih warna latar belakang:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ColorButton(
                    color: Colors.red,
                    onPressed: () => _changeBackgroundColor(Colors.red)),
                ColorButton(
                    color: Colors.green,
                    onPressed: () => _changeBackgroundColor(Colors.green)),
                ColorButton(
                    color: Colors.blue,
                    onPressed: () => _changeBackgroundColor(Colors.blue)),
                ColorButton(
                    color: Colors.yellow,
                    onPressed: () => _changeBackgroundColor(Colors.yellow)),
                ColorButton(
                    color: Colors.orange,
                    onPressed: () => _changeBackgroundColor(Colors.orange)),
                ColorButton(
                    color: Colors.purple,
                    onPressed: () => _changeBackgroundColor(Colors.purple)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk tombol warna
class ColorButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  const ColorButton({required this.color, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child: Container(),
    );
  }
}
