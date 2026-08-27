import 'package:flutter/material.dart';

// --- FIREBASE & BACKEND SERVICES HELPER ---
class AuthService {
  // User Login Logic Placeholder
  static Future<bool> loginUser(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network request
    if (email.isNotEmpty && password.length >= 6) {
      return true;
    }
    return false;
  }

  // User Registration Logic Placeholder
  static Future<bool> registerUser(String username, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}

class DatabaseService {
  // Fetch Reels Data Placeholder
  static List<Map<String, String>> getReels() {
    return [
      {'title': 'First Reel', 'url': 'https://sample-video.mp4'},
      {'title': 'Second Reel', 'url': 'https://sample-video2.mp4'},
    ];
  }

  // Fetch User Badges & Coins
  static Map<String, dynamic> getUserProfileData(String userId) {
    return {
      'username': 'IndexCreator',
      'coins': 1450,
      'badges': ['VIP', 'Golden Ring'],
      'rewardsTier': 'Gold',
    };
  }
}
