import 'package:final_project/components/my_drawer_tile.dart';
import 'package:final_project/pages/order_page.dart';
import 'package:final_project/pages/settings_page.dart';
import 'package:final_project/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authSevice = AuthService();
    authSevice.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // home list tile
          MyDrawerTile(
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
              text: "HOME"),

          // setting list tile
          MyDrawerTile(
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ));
              },
              text: "SETTING"),

          MyDrawerTile(
              icon: Icons.list,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderPage(),
                    ));
              },
              text: "LIST ORDERS"),

          const Spacer(),

          //logout list tile
          MyDrawerTile(icon: Icons.logout, onTap: logout, text: "LOG OUT"),
        ],
      ),
    );
  }
}
