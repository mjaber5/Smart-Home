import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/utils/app_router.dart';
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
            accountName: Text(
              'Mohammed Jaber',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            accountEmail: Text(
              'mhammdjbr555@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
          ),
          _buildDrawerItem(Icons.dashboard, 'Dashboard', () {
            GoRouter.of(context).push(AppRouter.kDashboardView);
          }),
          _buildDrawerItem(Icons.lightbulb_outline, 'Lighting', () {
            GoRouter.of(context).push(AppRouter.kLightingView);
          }),
          _buildDrawerItem(Icons.thermostat, 'Temperature', () {
            GoRouter.of(context).push(AppRouter.kTempratureView);
          }),
          _buildDrawerItem(Icons.security, 'Security', () {
            GoRouter.of(context).push(AppRouter.kSecurityView);
          }),
          _buildDrawerItem(Icons.wifi, 'Wi-Fi Settings', () {
            GoRouter.of(context).push(AppRouter.kWifiSettingsView);
          }),
          _buildDrawerItem(Icons.settings, 'Settings', () {
            GoRouter.of(context).push(AppRouter.kSettingsView);
          }),
          const Spacer(),
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
