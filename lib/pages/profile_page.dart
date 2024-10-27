import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/base_page.dart';
import 'package:getwidget/getwidget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Profile'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GFListTile(
                avatar: GFAvatar(
                  backgroundImage: NetworkImage(
                    'https://raw.githubusercontent.com/aqmal101/background-image/refs/heads/main/%CA%9A%C9%9E.jpeg',
                  ),
                  size: GFSize.LARGE,
                ),
                titleText: 'Rereregulus',
                subTitleText: 'Following | 150  Followers | 200',
                icon: Icon(Icons.edit),
                padding: EdgeInsets.all(8), // Optional, for better spacing
                margin: EdgeInsets.symmetric(
                    vertical: 8), // Optional, for vertical spacing
                // border: Border.all(color: Colors.grey),
              ),
              // const Text('Profile Page Content'),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: GFButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp()),
                    );
                  },
                  type: GFButtonType.solid,
                  color: GFColors.DANGER,
                  text: "Logout",
                  icon: Icon(Icons.logout_rounded, color: Colors.white),
                  shape: GFButtonShape.pills,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
