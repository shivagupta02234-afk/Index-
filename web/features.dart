import 'package:flutter/material.dart';

// --- 1. STORIES / STATUS MODULE ---
class StoriesWidget extends StatelessWidget {
  const StoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.pinkAccent, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    child: Text('User $index'),
                  ),
                ),
                const SizedBox(height: 4),
                Text('Status $index', style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}

// --- 2. BUSINESS / JOB HUB ---
class BusinessHubScreen extends StatelessWidget {
  const BusinessHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Index Business & Jobs')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Featured Opportunities', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildJobCard('Flutter App Developer', 'Remote • Full-time', '\$1,200/mo'),
          _buildJobCard('UI/UX Designer', 'Hybrid • Part-time', '\$800/mo'),
          _buildJobCard('Content Creator', 'Index Partner Program', 'Commission Based'),
        ],
      ),
    );
  }

  static Widget _buildJobCard(String title, String type, String salary) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(type),
        trailing: Text(salary, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        onTap: () {},
      ),
    );
  }
}

// --- 3. BADGES & AVATARS STORE ---
class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badges & Avatar Store')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          _buildStoreItem('Golden Ring', '100 Coins', Icons.stars, Colors.amber),
          _buildStoreItem('VIP Badge', '250 Coins', Icons.verified, Colors.blue),
          _buildStoreItem('Fire Aura', '500 Coins', Icons.local_fire_department, Colors.orange),
          _buildStoreItem('Neon Glow', '300 Coins', Icons.lightbulb, Colors.purple),
        ],
      ),
    );
  }

  static Widget _buildStoreItem(String name, String price, IconData icon, Color color) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: color),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(price, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: () {}, child: const Text('Buy')),
        ],
      ),
    );
  }
}

// --- 4. CARD-BASED REWARD SYSTEM ---
class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cards & Rewards')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Index Rewards Pass', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Text('Points: 1,450', style: TextStyle(color: Colors.white, fontSize: 24)),
                    SizedBox(height: 10),
                    Text('Tier: Gold Member', style: TextStyle(color: Colors.amberAccent)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
