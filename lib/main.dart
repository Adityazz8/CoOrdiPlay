import 'package:ataxia_project/models/DragandDrop.dart';
import 'package:ataxia_project/models/Taptheglow.dart';
import 'package:ataxia_project/models/followthepath.dart';
import 'package:ataxia_project/models/login_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoOrdiPlay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }
}

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with profile and coins
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Color.fromARGB(255, 145, 83, 226),
                      child: Icon(Icons.person, color: Colors.blue, size: 30),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'User',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 3, 3),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.stars, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            '0',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Social buttons row
              /* Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSocialButton(
                        FontAwesomeIcons.whatsapp, Colors.green, 'WhatsApp'),
                    _buildSocialButton(
                        FontAwesomeIcons.telegram, Colors.blue, 'Telegram'),
                    _buildSocialButton(
                        Icons.notifications, Colors.green, 'Notice'),
                    _buildSocialButton(Icons.history, Colors.green, 'History'),
                  ],
                ),
              ),*/

              // Logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Image.asset(
                  'lib/assests/ataxialogo1.png', // Make sure to add your logo asset
                  height: 120,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.games,
                    size: 120,
                    color: Colors.white,
                  ),
                ),
              ),

              // Games grid
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildGameButton(
                        context,
                        'Tap the Glow',
                        Icons.touch_app,
                        const Color.fromARGB(255, 152, 144, 184),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AtaxiaGameApp()),
                        ),
                      ),
                      _buildGameButton(
                        context,
                        'Drag and Drop',
                        Icons.drag_indicator,
                        const Color.fromARGB(255, 152, 144, 184),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DragDropGame()),
                        ),
                      ),
                      _buildGameButton(
                        context,
                        'Follow The Path',
                        Icons.timeline,
                        const Color.fromARGB(255, 152, 144, 184),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PathDrawingGame()),
                        ),
                      ),
                      _buildGameButton(
                        context,
                        'Practice Mode',
                        Icons.sports_esports,
                        const Color.fromARGB(255, 152, 144, 184),
                        () {}, // Add your fourth game here
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom buttons
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomButton(
                      'About',
                      Icons.play_circle_fill,
                      Colors.red,
                      () {},
                    ),
                    _buildBottomButton(
                      'Refer & Learn',
                      Icons.share,
                      const Color.fromARGB(255, 22, 21, 22),
                      () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color, String tooltip) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildGameButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Players: 253',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton(
    String title,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
