import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class LightingViewBody extends StatefulWidget {
  const LightingViewBody({super.key});

  @override
  State<LightingViewBody> createState() => _LightingViewBodyState();
}

class _LightingViewBodyState extends State<LightingViewBody> {
  double slidingBrightness = 50;
  bool isLightingLivingRoom = true;
  bool isLightingBedroom = false;
  bool isLightingKitchen = true;

  Color? backgroundColor; // Default background color

  void changeSceneColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Lighting Control',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBrightnessControl(),
                const SizedBox(height: 20),
                _buildRoomLightingControl('Living Room', isLightingLivingRoom, (
                  value,
                ) {
                  setState(() {
                    isLightingLivingRoom = value;
                  });
                }),
                _buildRoomLightingControl('Bedroom', isLightingBedroom, (
                  value,
                ) {
                  setState(() {
                    isLightingBedroom = value;
                  });
                }),
                _buildRoomLightingControl('Kitchen', isLightingKitchen, (
                  value,
                ) {
                  setState(() {
                    isLightingKitchen = value;
                  });
                }),
                const SizedBox(height: 20),
                _buildSmartLightScenes(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrightnessControl() {
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
            'Brightness',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.brightness_4, color: Colors.yellowAccent),
              const SizedBox(width: 10),
              Expanded(
                child: Slider(
                  value: slidingBrightness,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  activeColor: Colors.yellowAccent,
                  onChanged: (double value) {
                    setState(() {
                      slidingBrightness = value;
                    });
                  },
                ),
              ),
              Text(
                '${slidingBrightness.toInt()}%',
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoomLightingControl(
    String roomName,
    bool isOn,
    Function(bool) onToggle,
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
              Icon(
                isOn ? Icons.lightbulb : Icons.lightbulb_outline,
                size: 24,
                color: isOn ? Colors.yellowAccent : Colors.white70,
              ),
              const SizedBox(width: 10),
              Text(
                roomName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Switch(
            value: isOn,
            onChanged: onToggle,
            activeColor: Colors.yellowAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildSmartLightScenes() {
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
            'Light Scenes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSceneButton('Relax', Colors.blueAccent.withAlpha(50)),
              _buildSceneButton('Work', Colors.orangeAccent.withAlpha(50)),
              _buildSceneButton('Party', Colors.purpleAccent.withAlpha(50)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSceneButton(String name, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: () => changeSceneColor(color),
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
