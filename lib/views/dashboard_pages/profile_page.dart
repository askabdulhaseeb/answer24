// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/app_user.dart';
import '../../widgets/pages/profile/profile_option_tile.dart';
import '../user_screens/edit_user_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AppUser user = AppUser();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Profile')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(user.profileURL),
                              ),
                            ),
                            // child: Image.network(user.profileURL),
                          ),
                          Positioned(
                            bottom: 10,
                            right: MediaQuery.of(context).size.width * 0.30,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(EditUserScreen.routeName),
                              child: const CircleAvatar(
                                child: Icon(Icons.mode_edit_outline_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${user.firstName} ${user.lastName}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(user.phoneNumber),
                  ],
                ),
              ),
            ),
            ProfileOptionTile(
              icon: CupertinoIcons.chat_bubble,
              title: 'Chats',
              onTap: () {},
            ),
            const Divider(),
            ProfileOptionTile(
              icon: CupertinoIcons.person,
              title: 'Account',
              onTap: () {},
            ),
            const Divider(),
            ProfileOptionTile(
              icon: Icons.notifications_active_outlined,
              title: 'Notification',
              onTap: () {},
            ),
            const Divider(),
            ProfileOptionTile(
              icon: Icons.contact_mail_outlined,
              title: 'Invite a friend',
              onTap: () {},
            ),
            const Divider(),
            ProfileOptionTile(
              icon: CupertinoIcons.headphones,
              title: 'Help',
              onTap: () {},
            ),
            const Divider(),
            ProfileOptionTile(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
