import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:getwidget/getwidget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.orange, // Border color
                      width: 2, // Border width
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        child: GFAvatar(
                          child: Stack(
                            children: [
                              GFAvatar(
                                backgroundImage: NetworkImage(
                                    'https://raw.githubusercontent.com/aqmal101/background-image/refs/heads/main/%CA%9A%C9%9E.jpeg'),
                                size: GFSize.LARGE,
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: GFBadge(
                                  shape: GFBadgeShape.circle,
                                  color: GFColors.SUCCESS,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rereregulus',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '100',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Following'),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Column(
                                children: [
                                  Text(
                                    '200',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Followers'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              GFButton(
                  fullWidthButton: true,
                  shape: GFButtonShape.pills,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp()),
                    );
                  },
                  text: "Logout",
                  color: GFColors.DANGER,
                  icon: Icon(
                    Icons.logout_outlined,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
