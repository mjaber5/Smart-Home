import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:smart_home/core/utils/color.dart';

class EnergyViewBody extends StatelessWidget {
  const EnergyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: IColors.kSeconderyColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Energy Consumption',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildTotalEnergyCard(),
                const SizedBox(height: 20),
                const Text(
                  "Power Consumption (kWh)",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildEnergyChart(),
                const SizedBox(height: 20),
                const Text(
                  "Smart Devices",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildSmartDevicesGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalEnergyCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Energy Usage",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  "245 kWh",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
            const Icon(Icons.bolt, size: 40, color: Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergyChart() {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 2.5),
                const FlSpot(1, 3),
                const FlSpot(2, 2),
                const FlSpot(3, 3.5),
                const FlSpot(4, 3.2),
                const FlSpot(5, 4),
                const FlSpot(6, 3.8),
              ],
              isCurved: true,
              color: IColors.kFourthColor,
              barWidth: 4,
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmartDevicesGrid() {
    List<Map<String, dynamic>> devices = [
      {"name": "Room Lights", "icon": Icons.lightbulb_outline, "status": true},
      {"name": "Air Conditioner", "icon": Icons.ac_unit, "status": false},
      {"name": "Heater", "icon": Icons.local_fire_department, "status": true},
      {"name": "Refrigerator", "icon": Icons.kitchen, "status": true},
      {"name": "TV", "icon": Icons.tv, "status": false},
      {"name": "Fan", "icon": Icons.toys, "status": true},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: devices.length,
      itemBuilder: (context, index) {
        var device = devices[index];
        return ExpandableDeviceCard(
          name: device["name"],
          icon: device["icon"],
          isOn: device["status"],
        );
      },
    );
  }
}

class ExpandableDeviceCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final bool isOn;

  const ExpandableDeviceCard({
    super.key,
    required this.name,
    required this.icon,
    required this.isOn,
  });

  @override
  State<ExpandableDeviceCard> createState() => _ExpandableDeviceCardState();
}

class _ExpandableDeviceCardState extends State<ExpandableDeviceCard> {
  // To control the expanded state of the card
  bool _isExpanded = false;

  // To track the state of the switch for each device
  late bool _deviceState;

  @override
  void initState() {
    super.initState();
    // Initialize the device's switch state with the initial value
    _deviceState = widget.isOn;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded; // Toggle expanded state
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: SizedBox(
              height:
                  _isExpanded
                      ? 200
                      : 150, // Adjusted height for expanded and collapsed states
              width: double.infinity, // Take full width of the parent container
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Align content properly
                children: [
                  Icon(
                    widget.icon,
                    size: 40,
                    color: _deviceState ? IColors.kFourthColor : Colors.grey,
                  ), // Slightly larger icon
                  const SizedBox(height: 8), // More spacing
                  Text(
                    widget.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ), // Improved font styling
                  ),
                  const SizedBox(height: 12), // More spacing
                  // Only show the Switch if expanded
                  if (_isExpanded)
                    Switch(
                      value:
                          _deviceState, // Bind the switch value to the _deviceState
                      onChanged: (value) {
                        setState(() {
                          _deviceState =
                              value; // Update the device state when toggled
                        });
                      },
                      activeColor: IColors.kFourthColor,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
