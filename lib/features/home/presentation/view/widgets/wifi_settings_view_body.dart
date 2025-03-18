import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class WifiSettingsViewBody extends StatefulWidget {
  const WifiSettingsViewBody({super.key});

  @override
  State<WifiSettingsViewBody> createState() => _WifiSettingsViewBodyState();
}

class _WifiSettingsViewBodyState extends State<WifiSettingsViewBody> {
  bool isWifiOn = true;
  String connectedNetwork = "Smart Home Hub";
  List<Map<String, dynamic>> availableNetworks = [
    {"name": "Smart Home Hub", "strength": 4},
    {"name": "IoT Devices Network", "strength": 3},
    {"name": "Guest Network", "strength": 2},
    {"name": "Office Network", "strength": 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WiFi Settings",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          children: [
            _buildWifiToggle(),
            const SizedBox(height: 24),
            if (isWifiOn) _buildConnectedNetworkCard(),
            const SizedBox(height: 24),
            if (isWifiOn) _buildAvailableNetworksList(),
            const SizedBox(height: 20),
            _buildSmartHomeControlPanel(),
          ],
        ),
      ),
    );
  }

  Widget _buildWifiToggle() {
    return Card(
      color: IColors.kPrimaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Smart Home WiFi",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Switch(
              value: isWifiOn,
              onChanged: (value) {
                setState(() {
                  isWifiOn = value;
                });
              },
              activeColor: Colors.green,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectedNetworkCard() {
    return Card(
      color: IColors.kSeconderyColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.home, color: Colors.greenAccent, size: 32),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  connectedNetwork,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Connected to your Smart Home Network",
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(Icons.check_circle, color: Colors.greenAccent, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailableNetworksList() {
    return Expanded(
      child: ListView.builder(
        itemCount: availableNetworks.length,
        itemBuilder: (context, index) {
          var network = availableNetworks[index];
          return Card(
            color: IColors.kPrimaryColor.withOpacity(0.1),
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: Icon(
                Icons.wifi,
                color: _getSignalColor(network['strength']),
              ),
              title: Text(
                network['name'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Signal Strength: ${network['strength']}",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              trailing: Icon(
                Icons.lock,
                color:
                    network['strength'] < 3 ? Colors.grey : Colors.blueAccent,
              ),
              onTap: () {
                setState(() {
                  connectedNetwork = network['name'];
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSmartHomeControlPanel() {
    return Card(
      color: IColors.kPrimaryColor.withOpacity(0.1),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Smart Home Devices",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            // Handle control action
          },
        ),
        Text(
          deviceName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Color _getSignalColor(int strength) {
    switch (strength) {
      case 4:
        return Colors.greenAccent;
      case 3:
        return Colors.orangeAccent;
      case 2:
        return Colors.yellowAccent;
      default:
        return Colors.redAccent;
    }
  }
}
