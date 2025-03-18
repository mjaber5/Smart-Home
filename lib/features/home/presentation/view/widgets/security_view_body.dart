import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class SecurityViewBody extends StatefulWidget {
  const SecurityViewBody({super.key});

  @override
  State<SecurityViewBody> createState() => _SecurityViewBodyState();
}

class _SecurityViewBodyState extends State<SecurityViewBody> {
  bool isOpen = false;
  bool isArmed = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: IColors.kSeconderyColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Security Control',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // 📹 Live Camera Feed
            _buildSecurityCamera(),

            const SizedBox(height: 20),

            // 🚪 Door Lock Control
            _buildDoorLockControl(),

            const SizedBox(height: 20),

            // 🚨 Motion Detection & Alerts
            _buildMotionDetectionAlerts(),

            const SizedBox(height: 20),

            // 🔥 Smart Sensors Display
            _buildSmartSensors(),

            const SizedBox(height: 20),

            // 🔔 Alarm System Control
            _buildAlarmSystemToggle(),
          ],
        ),
      ),
    );
  }

  /// 📹 **Live Security Camera Preview**
  Widget _buildSecurityCamera() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: IColors.kSeconderyColor.withOpacity(0.3),
      ),
      child: const Center(
        child: Icon(Icons.videocam, size: 50, color: Colors.white70),
      ),
    );
  }

  /// 🚪 **Door Lock Control**
  Widget _buildDoorLockControl() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: IColors.kSeconderyColor.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Main Door Lock',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Status: Locked',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              Switch(
                value: isOpen,
                onChanged: (value) {
                  setState(() {
                    isOpen = value;
                  });
                },
                activeColor: Colors.greenAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🚨 **Motion Detection & Alerts**
  Widget _buildMotionDetectionAlerts() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: IColors.kSeconderyColor.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Motion Detection',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.warning, color: Colors.redAccent),
              const SizedBox(width: 10),
              Expanded(
                child: const Text(
                  '⚠ Motion detected in the living room!',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🔥 **Smart Sensors (Smoke, Door, Window)**
  Widget _buildSmartSensors() {
    return Column(
      children: [
        _buildSensorTile(
          'Smoke Detector',
          'Normal',
          Icons.smoke_free,
          Colors.greenAccent,
        ),
        _buildSensorTile(
          'Window Sensor',
          'Closed',
          Icons.window,
          Colors.blueAccent,
        ),
        _buildSensorTile(
          'Garage Door',
          'Open',
          Icons.garage,
          Colors.orangeAccent,
        ),
      ],
    );
  }

  Widget _buildSensorTile(
    String title,
    String status,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: IColors.kSeconderyColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: color),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(
            status,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  /// 🔔 **Alarm System Toggle**
  Widget _buildAlarmSystemToggle() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: IColors.kSeconderyColor.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alarm System',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status: ${isArmed ? 'Armed' : 'not armed'} ',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              Switch(
                value: isArmed,
                onChanged: (value) {
                  setState(() {
                    isArmed = value;
                  });
                },
                activeColor: Colors.redAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
