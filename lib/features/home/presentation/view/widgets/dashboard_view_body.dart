import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class DashboardViewBody extends StatefulWidget {
  const DashboardViewBody({super.key});

  @override
  State<DashboardViewBody> createState() => _DashboardViewBodyState();
}

class _DashboardViewBodyState extends State<DashboardViewBody> {
  double climateControlTemp = 22.0; // Initial temperature value
  double speakerVolume = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔙 Back & Title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 🌤️ Weather Widget
          _buildWeatherWidget(),

          const SizedBox(height: 20),

          // 🎛️ Smart Controls
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildDashboardCard(
                icon: Icons.thermostat,
                title: 'Temperature',
                subtitle: '${climateControlTemp.toInt()}°C',
                color: Colors.orangeAccent,
              ),
              _buildDashboardCard(
                icon: Icons.lightbulb,
                title: 'Lighting',
                subtitle: '5 Active',
                color: Colors.yellowAccent.shade700,
              ),
              _buildDashboardCard(
                icon: Icons.lock,
                title: 'Security',
                subtitle: 'Armed',
                color: Colors.redAccent,
              ),
              _buildDashboardCard(
                icon: Icons.wifi,
                title: 'Wi-Fi',
                subtitle: 'Connected',
                color: Colors.blueAccent,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 🏠 Room Climate Control
          _buildClimateControl(),

          const SizedBox(height: 20),

          // 📡 Speaker System
          _buildSpeakerCard(),

          const SizedBox(height: 20),

          // 📊 Energy Usage Graph
          _buildEnergyUsageGraph(),

          const SizedBox(height: 20),

          // 🔍 Security Camera Preview
          _buildSecurityCameraPreview(),
        ],
      ),
    );
  }

  /// 🌤️ **Weather Widget**
  Widget _buildWeatherWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: IColors.kSeconderyColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Current Weather',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Sunny, 25°C',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
          Image.asset('assets/icons/3.png', width: 100),
          // Icon(Icons.wb_sunny, size: 40, color: Colors.yellowAccent),
        ],
      ),
    );
  }

  /// 🏡 **Reusable Dashboard Card**
  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: IColors.kSeconderyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: color),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.white70)),
        ],
      ),
    );
  }

  /// 🌡️ **Climate Control (Temperature)**
  Widget _buildClimateControl() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: IColors.kSeconderyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Climate Control',
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
                'Temperature: ${climateControlTemp.toInt()}°C',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              Icon(Icons.thermostat, color: Colors.orangeAccent),
            ],
          ),
          Slider(
            value: climateControlTemp,
            min: 16,
            max: 30,
            onChanged: (value) => setState(() => climateControlTemp = value),
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }

  /// 🔊 **Speaker Volume Control**
  Widget _buildSpeakerCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: IColors.kSeconderyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Speaker Volume',
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
              Image.asset('assets/images/kakao_mini.png', width: 50),
              Expanded(
                child: Slider(
                  value: speakerVolume,
                  min: 0,
                  max: 100,
                  onChanged:
                      (value) => setState(() {
                        speakerVolume = value;
                      }),
                  activeColor: Colors.white,
                ),
              ),
              Text(
                '${speakerVolume.toInt()}%',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 📊 **Energy Usage Graph**
  Widget _buildEnergyUsageGraph() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: IColors.kSeconderyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text(
          '📈 Energy Usage Graph (Coming Soon)',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  /// 🔍 **Security Camera Preview**
  Widget _buildSecurityCameraPreview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: IColors.kSeconderyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text(
          '📹 Live Security Camera (Coming Soon)',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
