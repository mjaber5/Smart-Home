import 'package:flutter/material.dart';
import 'package:smart_home/features/home/presentation/view/widgets/wifi_settings_view_body.dart';

class WifiSettingsView extends StatelessWidget {
  const WifiSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WifiSettingsViewBody());
  }
}
