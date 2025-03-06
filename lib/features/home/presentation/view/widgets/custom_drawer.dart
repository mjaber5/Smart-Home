import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: IColors.kSeconderyColor.withAlpha(45),
            ),
            accountName: const Text(
              'Mohammed Jaber',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: IColors.kFourthColor,
              ),
            ),
            accountEmail: const Text(
              'mhammdjbr555gmail.com',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: IColors.kFourthColor,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/icons/2.png'),
            ),
          ),
          _buildDrawerItem(Icons.dashboard, 'Dashboard', () {}),
          _buildDrawerItem(Icons.lightbulb_outline, 'Lighting', () {}),
          _buildDrawerItem(Icons.thermostat, 'Temperature', () {}),
          _buildDrawerItem(Icons.security, 'Security', () {}),
          _buildDrawerItem(Icons.wifi, 'Wi-Fi Settings', () {}),
          _buildDrawerItem(Icons.settings, 'Settings', () {}),
          const Spacer(),
          const Divider(),
          _buildDrawerItem(
            Icons.logout,
            'Logout',
            () {},
            isLogout: true,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isLogout = false,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : IColors.kSeconderyColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),

      onTap: onTap,
    );
  }
}
