import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class EntertainmentViewBody extends StatefulWidget {
  const EntertainmentViewBody({super.key});

  @override
  State<EntertainmentViewBody> createState() => _EntertainmentViewBodyState();
}

class _EntertainmentViewBodyState extends State<EntertainmentViewBody> {
  // Store the device states
  final Map<String, bool> deviceStates = {
    "Living Room TV": true,
    "Sound System": false,
    "Smart Lights": true,
  };

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
                const SizedBox(height: 20),
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
                    const Text(
                      'Entertainment',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Play movies:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildFeaturedMedia(),
                const SizedBox(height: 20),
                _buildMoviesSection(),
                const SizedBox(height: 20),
                _buildMediaControlCards(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Featured Media Section
  Widget _buildFeaturedMedia() {
    return GestureDetector(
      onTap: () {
        // Handle tap
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage('assets/images/movies/harry.webp'),
            fit: BoxFit.cover,
          ),
        ),
        height: 250,
        child: const Center(
          child: Icon(Icons.play_arrow, color: Colors.white, size: 60),
        ),
      ),
    );
  }

  // Scrollable Movie Section
  Widget _buildMoviesSection() {
    List<Map<String, String>> movies = [
      {"title": "Movie 1", "image": 'assets/images/movies/got.jpg'},
      {"title": "Movie 2", "image": 'assets/images/movies/extraction.jpg'},
      {"title": "Movie 3", "image": 'assets/images/movies/munoya.webp'},
      {"title": "Movie 4", "image": 'assets/images/movies/squid-game.jpg'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Best Month Movies",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {
                    // Handle movie selection
                  },
                  child: Hero(
                    tag: movies[index]['title']!,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(movies[index]['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 180,
                      width: 120,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black.withOpacity(0.4),
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Media Control Cards
  Widget _buildMediaControlCards() {
    return Column(
      children:
          deviceStates.keys.map((device) {
            return Column(
              children: [
                _buildMediaCard(device, deviceStates[device]!),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
    );
  }

  // Single Smart Device Control Card
  Widget _buildMediaCard(String deviceName, bool isOn) {
    return GestureDetector(
      onTap: () {
        setState(() {
          deviceStates[deviceName] = !deviceStates[deviceName]!;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    _getDeviceIcon(deviceName),
                    color: isOn ? IColors.kFourthColor : Colors.grey,
                    size: 40,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    deviceName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Switch(
                value: isOn,
                onChanged: (value) {
                  setState(() {
                    deviceStates[deviceName] = value;
                  });
                },
                activeColor: IColors.kFourthColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Get appropriate icon for the device
  IconData _getDeviceIcon(String deviceName) {
    switch (deviceName) {
      case "Living Room TV":
        return Icons.tv;
      case "Sound System":
        return Icons.headphones;
      case "Smart Lights":
        return Icons.lightbulb;
      default:
        return Icons.device_unknown;
    }
  }
}
