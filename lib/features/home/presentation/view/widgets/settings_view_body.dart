import 'package:flutter/material.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSectionTitle("Smart Home Control"),
              const SizedBox(height: 16),
              _buildControlPanel(),
              const SizedBox(height: 26),
              _buildSectionTitle("Network & Connectivity"),
              const SizedBox(height: 16),
              _buildNetworkSettings(),
              const SizedBox(height: 26),
              _buildSectionTitle("Security Settings"),
              const SizedBox(height: 16),
              _buildSecuritySettings(),
              const SizedBox(height: 26),
              _buildSectionTitle("Energy Management"),
              const SizedBox(height: 16),
              _buildEnergyManagement(),
            ],
          ),
        ),
      ),
    );
  }

  // Section title widget
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  // Control Panel for Smart Home Devices
  Widget _buildControlPanel() {
    return Card(
      color: Colors.blueAccent.withOpacity(0.1),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDeviceControl(
                  "Living Room Lights",
                  Icons.lightbulb,
                  Colors.yellowAccent,
                ),
                _buildDeviceControl(
                  "Thermostat",
                  Icons.thermostat_outlined,
                  Colors.orangeAccent,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDeviceControl(
                  "Front Door Lock",
                  Icons.lock,
                  Colors.greenAccent,
                ),
                _buildDeviceControl(
                  "Security Camera",
                  Icons.security,
                  Colors.redAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Device control widget (e.g., lights, thermostat)
  Widget _buildDeviceControl(
    String deviceName,
    IconData icon,
    Color iconColor,
  ) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: iconColor, size: 36),
          onPressed: () {
            // Handle device control actions
          },
        ),
        Text(deviceName),
      ],
    );
  }

  // Network Settings for Wi-Fi and Connectivity
  Widget _buildNetworkSettings() {
    return Card(
      color: Colors.greenAccent.withOpacity(0.1),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNetworkItem("Wi-Fi Network", Icons.wifi),
            const SizedBox(height: 16),
            _buildNetworkItem("Bluetooth", Icons.bluetooth),
          ],
        ),
      ),
    );
  }

  // Network Item (Wi-Fi, Bluetooth, etc.)
  Widget _buildNetworkItem(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blueAccent),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Switch(
          value: true, // Replace with actual network status
          onChanged: (value) {
            // Handle network toggle
          },
          activeColor: Colors.blueAccent,
        ),
      ],
    );
  }

  // Security Settings for Home Automation
  Widget _buildSecuritySettings() {
    return Card(
      color: Colors.redAccent.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSecurityItem("Home Security", Icons.security),
            const SizedBox(height: 16),
            _buildSecurityItem("Emergency Alerts", Icons.notifications_active),
          ],
        ),
      ),
    );
  }

  // Security Item (Security systems, Alerts)
  Widget _buildSecurityItem(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.redAccent),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Switch(
          value: true, // Replace with actual security status
          onChanged: (value) {
            // Handle security toggle
          },
          activeColor: Colors.redAccent,
        ),
      ],
    );
  }

  // Energy Management settings
  Widget _buildEnergyManagement() {
    return Card(
      color: Colors.yellowAccent.withOpacity(0.1),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildEnergyItem("Energy Consumption", Icons.battery_charging_full),
            const SizedBox(height: 16),
            _buildEnergyItem("Smart Mode", Icons.flash_on),
          ],
        ),
      ),
    );
  }

  // Energy Item (Energy consumption, Smart Mode)
  Widget _buildEnergyItem(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.yellowAccent),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Switch(
          value: true, // Replace with actual energy status
          onChanged: (value) {
            // Handle energy toggle
          },
          activeColor: Colors.yellowAccent,
        ),
      ],
    );
  }
}
