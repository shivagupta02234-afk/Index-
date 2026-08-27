import 'package:flutter/material.dart';

void main() {
  runApp(const IndexApp());
}

class IndexApp extends StatelessWidget {
  const IndexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Index',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF0F0F14),
      ),
      home: const LoginSplashScreen(),
    );
  }
}

// 1. Animated Login / Splash Screen
class LoginSplashScreen extends StatefulWidget {
  const LoginSplashScreen({super.key});

  @override
  State<LoginSplashScreen> createState() => _LoginSplashScreenState();
}

class _LoginSplashScreenState extends State<LoginSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.blur_on_rounded, size: 90, color: Colors.deepPurpleAccent),
                const SizedBox(height: 10),
                const Text(
                  'INDEX',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 4),
                ),
                const SizedBox(height: 50),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  icon: const Icon(Icons.g_mobiledata, size: 30),
                  label: const Text('Sign in with Google'),
                  onPressed: () => _navigateToHome(context),
                ),
                const SizedBox(height: 15),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  icon: const Icon(Icons.email_outlined),
                  label: const Text('Sign up with Email'),
                  onPressed: () => _navigateToHome(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainHomeScreen()),
    );
  }
}

// 2. Main App Screen with Navigation Tabs
class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ReelsFeedScreen(),
    const NewsAndEventsScreen(),
    const ChatAndEmailScreen(),
    const StoreScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF16161E),
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: 'Reels'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'News/Events'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Placeholder Screens
class ReelsFeedScreen extends StatelessWidget {
  const ReelsFeedScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Reels Feed & Status Section'));
}

class NewsAndEventsScreen extends StatelessWidget {
  const NewsAndEventsScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('News, Jobs & Company Events'));
}

class ChatAndEmailScreen extends StatelessWidget {
  const ChatAndEmailScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('1-on-1 Chat & Email Messages'));
}

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Store: Stickers, Avatars & Cards'));
}

// 3. Profile Screen with Animated Ring & Cards Preview
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Index Profile'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Ring Demo (Golden Card / President Card Ring Effect)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [Colors.amber, Colors.orange, Colors.yellow, Colors.amber],
                ),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'User Name',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Icon(Icons.check_circle, color: Colors.green, size: 20), // Green Tick (Free System Tick)
                Icon(Icons.verified, color: Colors.blue, size: 20), // Blue Tick (Bought)
              ],
            ),
            const SizedBox(height: 20),
            // Cards Collection Showcase
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('My Unlocked Cards', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCardItem('Golden Card', '10k Followers', Colors.amber),
                  _buildCardItem('Silver Card', '1k Followers', Colors.grey.shade400),
                  _buildCardItem('Company Card', 'Verified Business', Colors.blueAccent),
                  _buildCardItem('President Card', 'Official VIP', Colors.purpleAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem(String title, String subtitle, Color color) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.credit_card, color: color),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}
