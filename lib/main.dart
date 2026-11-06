import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:math' as math;

void main() {
  runApp(const BloodAvailabilityApp());
}

class BloodAvailabilityApp extends StatelessWidget {
  const BloodAvailabilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Availability System',
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 🔹 Login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE4E1), Color(0xFFFFB6C1), Color(0xFFFFC0CB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.bloodtype,
                        size: 60,
                        color: Color(0xFFDB7093),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Blood Availability System",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFDB7093),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0xFFDB7093),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFFDB7093),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFDB7093), Color(0xFFFF69B4)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFDB7093).withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to Main Dashboard after login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainDashboard(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Register here",
                    style: TextStyle(
                      color: Color(0xFFDB7093),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: _viewRegisteredUsers,
                  child: const Text(
                    "🔍 View Registered Users",
                    style: TextStyle(
                      color: Color(0xFFDB7093),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFDB7093), Color(0xFFFF69B4)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFDB7093).withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "📊 View Registration Dashboard",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _viewRegisteredUsers() async {
    try {
      final String? data = html.window.localStorage['blood_users'];
      String message;

      if (data == null || data.isEmpty) {
        message = "No users registered yet.";
      } else {
        final List<dynamic> users = jsonDecode(data);
        message = "📊 Registered Users (${users.length} total):\n\n";

        for (int i = 0; i < users.length; i++) {
          final user = users[i];
          message += "${i + 1}. ${user['name']}\n";
          message += "   📧 Email: ${user['email']}\n";
          message += "   🩸 Blood Group: ${user['blood_group']}\n";
          message += "   👤 Role: ${user['role']}\n";
          message += "   📱 Phone: ${user['phone']}\n";
          message += "   📍 Location: ${user['location']}\n\n";
        }
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('🗂️ Registered Users Database'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Text(
                message,
                style: const TextStyle(fontFamily: 'monospace'),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error reading user data: $e')));
    }
  }
}

// 🏠 Main Dashboard Screen - MODERN DESIGN
class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  // NEW: Notification and Location variables
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  List<Map<String, dynamic>> notifications = [];
  Position? currentPosition;
  List<Map<String, dynamic>> nearbyDonors = [];
  Timer? notificationTimer;

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _getCurrentLocation();
    _startNotificationUpdates();
  }

  @override
  void dispose() {
    notificationTimer?.cancel();
    super.dispose();
  }

  // Initialize notifications
  Future<void> _initializeNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin?.initialize(initializationSettings);

    // Add initial notifications
    _addInitialNotifications();
  }

  void _addInitialNotifications() {
    notifications = [
      {
        'id': '1',
        'title': 'New donor matched nearby',
        'message': 'John Doe (O+) available 1.2km away',
        'time': '2 min ago',
        'icon': Icons.person_add,
        'type': 'match',
        'isRead': false,
      },
      {
        'id': '2',
        'title': '🚨 Emergency Alert',
        'message': 'Critical O- needed at City Hospital',
        'time': '5 min ago',
        'icon': Icons.emergency,
        'type': 'emergency',
        'isRead': false,
      },
      {
        'id': '3',
        'title': 'Blood camp tomorrow',
        'message': 'Free health checkup at City Center 9 AM',
        'time': '1 hour ago',
        'icon': Icons.event,
        'type': 'event',
        'isRead': true,
      },
      {
        'id': '4',
        'title': 'Donation reminder',
        'message': 'You are eligible to donate blood again',
        'time': '3 hours ago',
        'icon': Icons.check_circle,
        'type': 'reminder',
        'isRead': false,
      },
    ];
  }

  void _startNotificationUpdates() {
    notificationTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (mounted) {
        _addRandomNotification();
      }
    });
  }

  void _addRandomNotification() {
    final random = math.Random();
    final notificationTypes = [
      {
        'title': 'New donor registered',
        'message': 'Sarah M. (B+) joined nearby',
        'type': 'match',
        'icon': Icons.person_add,
      },
      {
        'title': 'Blood request fulfilled',
        'message': 'Your donation helped save a life!',
        'type': 'success',
        'icon': Icons.favorite,
      },
      {
        'title': 'Stock update',
        'message': 'A+ blood stock is running low',
        'type': 'warning',
        'icon': Icons.warning,
      },
    ];

    final notification =
        notificationTypes[random.nextInt(notificationTypes.length)];

    setState(() {
      notifications.insert(0, {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'title': notification['title'],
        'message': notification['message'],
        'time': 'Just now',
        'icon': notification['icon'],
        'type': notification['type'],
        'isRead': false,
      });

      // Keep only last 10 notifications
      if (notifications.length > 10) {
        notifications = notifications.take(10).toList();
      }
    });
  }

  // Get current location
  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      currentPosition = await Geolocator.getCurrentPosition();
      _findNearbyDonors();
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _findNearbyDonors() {
    // Simulate nearby donors data
    nearbyDonors = [
      {
        'name': 'John Doe',
        'blood': 'O+',
        'distance': 1.2,
        'lat': 28.6139,
        'lng': 77.2090,
      },
      {
        'name': 'Sarah Smith',
        'blood': 'A+',
        'distance': 2.1,
        'lat': 28.6169,
        'lng': 77.2100,
      },
      {
        'name': 'Mike Johnson',
        'blood': 'B+',
        'distance': 3.4,
        'lat': 28.6199,
        'lng': 77.2110,
      },
      {
        'name': 'City Hospital',
        'blood': 'Blood Bank',
        'distance': 0.8,
        'lat': 28.6129,
        'lng': 77.2080,
      },
      {
        'name': 'Red Cross Center',
        'blood': 'Blood Bank',
        'distance': 1.5,
        'lat': 28.6149,
        'lng': 77.2095,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE4E1), Color(0xFFFFB6C1), Color(0xFFFFC0CB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Enhanced Header with Notification Bell
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Blood Availability System",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFDB7093),
                          ),
                        ),
                        Text(
                          "Welcome back! Save lives today",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // Notification Bell
                        Stack(
                          children: [
                            IconButton(
                              onPressed: _showNotifications,
                              icon: const Icon(
                                Icons.notifications_outlined,
                                color: Color(0xFFDB7093),
                                size: 28,
                              ),
                            ),
                            if (notifications
                                .where((n) => !n['isRead'])
                                .isNotEmpty)
                              Positioned(
                                right: 8,
                                top: 8,
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${notifications.where((n) => !n['isRead']).length}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => _showProfileMenu(),
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xFFDB7093),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search by Blood Group, Location, or Hospital",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFFDB7093),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Interactive Map Section - NEW
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF2196F3), Color(0xFF21CBF3)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.map,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "🗺️ Nearby Donors & Blood Banks",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Stack(
                                  children: [
                                    // Simulated Map Background
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.green[100]!,
                                            Colors.blue[100]!,
                                          ],
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "🗺️ Interactive Map\n(Tap to view full map)",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Location markers
                                    Positioned(
                                      top: 20,
                                      left: 30,
                                      child: _buildMapMarker(
                                        "🩸",
                                        "You",
                                        Colors.red,
                                      ),
                                    ),
                                    Positioned(
                                      top: 35,
                                      right: 40,
                                      child: _buildMapMarker(
                                        "👤",
                                        "John D.",
                                        Colors.orange,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      left: 50,
                                      child: _buildMapMarker(
                                        "🏥",
                                        "Hospital",
                                        Colors.blue,
                                      ),
                                    ),
                                    // Full Map Button
                                    Positioned(
                                      bottom: 8,
                                      right: 8,
                                      child: ElevatedButton(
                                        onPressed: _openFullMap,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFFDB7093,
                                          ),
                                          minimumSize: const Size(60, 30),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                        ),
                                        child: const Text(
                                          "View Full Map",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Main Features Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.3,
                        children: [
                          _buildFeatureCard(
                            icon: Icons.bloodtype,
                            title: "Find Donor",
                            subtitle: "Search donors",
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
                            ),
                            onTap: () => _navigateToScreen("Find Donor"),
                          ),
                          _buildFeatureCard(
                            icon: Icons.local_hospital,
                            title: "Hospitals",
                            subtitle: "Find blood banks",
                            gradient: const LinearGradient(
                              colors: [Color(0xFF4ECDC4), Color(0xFF44A08D)],
                            ),
                            onTap: () => _navigateToScreen("Hospitals"),
                          ),
                          _buildFeatureCard(
                            icon: Icons.add_circle_outline,
                            title: "Request Blood",
                            subtitle: "Emergency request",
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFFB347), Color(0xFFFFCC02)],
                            ),
                            onTap: () => _navigateToScreen("Request Blood"),
                          ),
                          _buildFeatureCard(
                            icon: Icons.inventory,
                            title: "Availability",
                            subtitle: "Check stock levels",
                            gradient: const LinearGradient(
                              colors: [Color(0xFF9B59B6), Color(0xFF8E44AD)],
                            ),
                            onTap: () =>
                                _navigateToScreen("Check Availability"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // For Recipients Section - NEW
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.healing,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "For Recipients",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Need blood? Get instant help:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 10),
                            _buildMatchCriteria(
                              "🚨 Emergency Helpline",
                              "24/7",
                            ),
                            _buildMatchCriteria(
                              "🔍 Find Compatible Donors",
                              "Instant",
                            ),
                            _buildMatchCriteria(
                              "📱 Direct Contact",
                              "Available",
                            ),
                            _buildMatchCriteria(
                              "🏥 Hospital Network",
                              "Connected",
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () => _emergencyCall(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(0, 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text(
                                      "🚨 Emergency",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () => _requestBlood(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: const Color(0xFF667eea),
                                      minimumSize: const Size(0, 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text(
                                      "🩸 Request Blood",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // AI-Powered Section (IBDMA Algorithm) - UPDATED
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFDB7093), Color(0xFFFF69B4)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.psychology,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Text(
                                    "Smart Match", // REMOVED ALGORITHM NAME
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => _showIBDMAInfo(),
                                  icon: const Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "AI-powered donor matching based on:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 10),
                            _buildMatchCriteria(
                              "🩸 Blood Group Compatibility",
                              "98%",
                            ),
                            _buildMatchCriteria(
                              "📍 Distance & Location",
                              "2.5 km",
                            ),
                            _buildMatchCriteria("⏰ Availability Score", "High"),
                            _buildMatchCriteria("🚨 Urgency Level", "Critical"),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () => _findSmartMatch(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFFDB7093),
                                minimumSize: const Size(double.infinity, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "🔍 Find Smart Match",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Quick Stats
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "📊 Today's Impact",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFDB7093),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildStatItem("🩸", "124", "Donors Available"),
                                _buildStatItem(
                                  "🏥",
                                  "18",
                                  "Hospitals Connected",
                                ),
                                _buildStatItem("❤️", "67", "Lives Saved Today"),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Motivational Banner
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 40,
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Your blood can save lives",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Next Donation Eligible: 15 Jan 2026",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openChatbot(),
        backgroundColor: const Color(0xFFDB7093),
        icon: const Icon(Icons.chat, color: Colors.white),
        label: const Text(
          "Ask BloodBot",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == 3) {
              _showProfileMenu();
            } else {
              setState(() => _currentIndex = index);
            }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: const Color(0xFFDB7093),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.bloodtype),
              label: "Donors",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Requests"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }

  // NEW METHODS FOR NOTIFICATIONS AND MAP

  Widget _buildMapMarker(String emoji, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 12)),
          Text(
            label,
            style: const TextStyle(
              fontSize: 8,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showNotifications() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "🔔 Notifications",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFDB7093),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        for (var notification in notifications) {
                          notification['isRead'] = true;
                        }
                      });
                    },
                    child: const Text("Mark all as read"),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: notifications.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_off,
                            size: 64,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "No notifications yet",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: notification['isRead']
                                ? Colors.grey[100]
                                : const Color(0xFFFFE4E1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: notification['isRead']
                                  ? Colors.grey[300]!
                                  : const Color(0xFFDB7093),
                              width: 1,
                            ),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _getNotificationColor(
                                notification['type'],
                              ),
                              child: Icon(
                                notification['icon'],
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            title: Text(
                              notification['title'],
                              style: TextStyle(
                                fontWeight: notification['isRead']
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  notification['message'],
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  notification['time'],
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            trailing: notification['isRead']
                                ? null
                                : Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFDB7093),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                            onTap: () {
                              setState(() {
                                notification['isRead'] = true;
                              });
                              _handleNotificationTap(notification);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getNotificationColor(String type) {
    switch (type) {
      case 'emergency':
        return Colors.red;
      case 'match':
        return Colors.green;
      case 'event':
        return Colors.blue;
      case 'warning':
        return Colors.orange;
      case 'success':
        return Colors.purple;
      default:
        return const Color(0xFFDB7093);
    }
  }

  void _handleNotificationTap(Map<String, dynamic> notification) {
    Navigator.pop(context);

    switch (notification['type']) {
      case 'emergency':
        _emergencyCall();
        break;
      case 'match':
        _findSmartMatch();
        break;
      case 'event':
        _showEventDetails();
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Opening ${notification['title']}...'),
            backgroundColor: const Color(0xFFDB7093),
          ),
        );
    }
  }

  void _showEventDetails() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🩸 Blood Donation Camp'),
        content: const Text(
          'Join us tomorrow for a free blood donation camp!\n\n'
          '📅 Date: Tomorrow, 9:00 AM\n'
          '📍 Location: City Center, Main Hall\n'
          '🩺 Free health checkup included\n'
          '🎁 Refreshments provided\n\n'
          'Help save lives by donating blood!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Maybe Later'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('✅ Registered for blood camp!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDB7093),
            ),
            child: const Text(
              'Register Now',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _openFullMap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullMapScreen(
          nearbyDonors: nearbyDonors,
          currentPosition: currentPosition,
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMatchCriteria(String criterion, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            criterion,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String emoji, String number, String label) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 5),
        Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFDB7093),
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void _navigateToScreen(String screenName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🔄 Opening $screenName...'),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFFDB7093),
      ),
    );
  }

  void _showProfileMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFDB7093),
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 15),
            const Text(
              "User Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFDB7093),
              ),
            ),
            const SizedBox(height: 20),
            _buildProfileOption(
              Icons.person,
              "My Profile",
              () => Navigator.pop(context),
            ),
            _buildProfileOption(
              Icons.settings,
              "Settings",
              () => Navigator.pop(context),
            ),
            _buildProfileOption(
              Icons.help,
              "Help & Support",
              () => Navigator.pop(context),
            ),
            _buildProfileOption(
              Icons.info,
              "About",
              () => Navigator.pop(context),
            ),
            _buildProfileOption(
              Icons.logout,
              "Logout",
              () => _logout(),
              isLogout: true,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : const Color(0xFFDB7093),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isLogout ? Colors.red : Colors.black87,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }

  void _logout() {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _emergencyCall() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🚨 Emergency Helpline'),
        content: const Text(
          'Calling Emergency Blood Bank...\n\n📞 1800-BLOOD-HELP\n📞 +91 98765 43210\n\nConnecting you to nearest blood bank with required blood type.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _requestBlood() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🩸 Request Blood'),
        content: const Text(
          'Your blood request has been sent to:\n\n• 15 nearby donors\n• 8 blood banks\n• Emergency services\n\nExpected response time: 5-10 minutes',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showIBDMAInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🧠 Smart Match Algorithm'),
        content: const Text(
          'Intelligent Blood Donor Matching Algorithm uses AI to:\n\n• Match blood group compatibility\n• Calculate optimal distance\n• Check donor availability\n• Prioritize by urgency level\n• Consider donation eligibility\n\nThis ensures the fastest and most suitable donor match for critical situations.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it!'),
          ),
        ],
      ),
    );
  }

  void _findSmartMatch() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🔍 Smart Match Results'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Top 3 AI-recommended donors:'),
            const SizedBox(height: 15),
            _buildDonorMatch("John Doe", "O+", "1.2 km", "95%"),
            _buildDonorMatch("Sarah Smith", "O+", "2.1 km", "92%"),
            _buildDonorMatch("Mike Johnson", "O+", "3.4 km", "88%"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Contact Donors'),
          ),
        ],
      ),
    );
  }

  Widget _buildDonorMatch(
    String name,
    String bloodGroup,
    String distance,
    String score,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE4E1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('$bloodGroup • $distance'),
            ],
          ),
          Text(
            score,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _openChatbot() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🤖 BloodBot Assistant'),
        content: const Text(
          'Hello! I\'m BloodBot, your AI assistant.\n\nI can help you with:\n• Finding nearby donors\n• Blood bank information\n• Emergency contacts\n• Donation eligibility\n• General blood donation queries\n\nHow can I assist you today?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Start Chat'),
          ),
        ],
      ),
    );
  }
} // End of _MainDashboardState class

// Add this class after the MainDashboard class and before RegisterScreen:

class FullMapScreen extends StatefulWidget {
  final List<Map<String, dynamic>> nearbyDonors;
  final Position? currentPosition;

  const FullMapScreen({
    super.key,
    required this.nearbyDonors,
    this.currentPosition,
  });

  @override
  State<FullMapScreen> createState() => _FullMapScreenState();
}

class _FullMapScreenState extends State<FullMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🗺️ Nearby Donors & Blood Banks'),
        backgroundColor: const Color(0xFFDB7093),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE4E1), Color(0xFFFFB6C1), Color(0xFFFFC0CB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text(
            '🗺️ Full Interactive Map\n\nShowing nearby donors and blood banks\nwith real-time locations',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFDB7093),
            ),
          ),
        ),
      ),
    );
  }
}

// Add these classes at the end of your file (after FullMapScreen):

// 📝 Register Screen
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  String _selectedBloodGroup = 'A+';
  String _selectedRole = 'Donor';

  final List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  final List<String> _roles = ['Donor', 'Recipient', 'Hospital', 'Blood Bank'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE4E1), Color(0xFFFFB6C1), Color(0xFFFFC0CB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.person_add,
                        size: 60,
                        color: Color(0xFFDB7093),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFDB7093),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Join our blood donation community",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Form Fields
                _buildTextField(_nameController, "Full Name", Icons.person),
                const SizedBox(height: 16),
                _buildTextField(_emailController, "Email", Icons.email),
                const SizedBox(height: 16),
                _buildTextField(
                  _passwordController,
                  "Password",
                  Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 16),
                _buildTextField(_phoneController, "Phone Number", Icons.phone),
                const SizedBox(height: 16),
                _buildTextField(
                  _locationController,
                  "Location",
                  Icons.location_on,
                ),
                const SizedBox(height: 16),

                // Blood Group Dropdown
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _selectedBloodGroup,
                    decoration: InputDecoration(
                      labelText: "Blood Group",
                      prefixIcon: const Icon(
                        Icons.bloodtype,
                        color: Color(0xFFDB7093),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    items: _bloodGroups.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedBloodGroup = newValue!;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // Role Dropdown
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _selectedRole,
                    decoration: InputDecoration(
                      labelText: "Role",
                      prefixIcon: const Icon(
                        Icons.assignment_ind,
                        color: Color(0xFFDB7093),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    items: _roles.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRole = newValue!;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 30),

                // Register Button
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFDB7093), Color(0xFFFF69B4)],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFDB7093).withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Already have an account? Login here",
                    style: TextStyle(
                      color: Color(0xFFDB7093),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xFFDB7093)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }

  void _registerUser() async {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    try {
      // Create user data
      final userData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'phone': _phoneController.text,
        'location': _locationController.text,
        'blood_group': _selectedBloodGroup,
        'role': _selectedRole,
        'registered_date': DateTime.now().toIso8601String(),
      };

      // Store in localStorage
      final String? existingData = html.window.localStorage['blood_users'];
      List<dynamic> users = [];

      if (existingData != null && existingData.isNotEmpty) {
        users = jsonDecode(existingData);
      }

      users.add(userData);
      html.window.localStorage['blood_users'] = jsonEncode(users);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Registration successful!'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate back to login
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Registration failed: $e')));
    }
  }
}

// 📊 Dashboard Screen for viewing registered users
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<dynamic> users = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() {
    try {
      final String? data = html.window.localStorage['blood_users'];
      if (data != null && data.isNotEmpty) {
        setState(() {
          users = jsonDecode(data);
        });
      }
    } catch (e) {
      print('Error loading users: $e');
    }
  }

  List<dynamic> get filteredUsers {
    if (searchQuery.isEmpty) return users;
    return users.where((user) {
      return user['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          user['blood_group'].toLowerCase().contains(
            searchQuery.toLowerCase(),
          ) ||
          user['role'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          user['location'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE4E1), Color(0xFFFFB6C1), Color(0xFFFFC0CB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFFDB7093),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Registration Dashboard",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFDB7093),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          onPressed: _loadUsers,
                          icon: const Icon(
                            Icons.refresh,
                            color: Color(0xFFDB7093),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText:
                            "Search by name, blood group, role, or location",
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFFDB7093),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              // Stats
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard(
                      "Total Users",
                      "${users.length}",
                      Icons.people,
                    ),
                    _buildStatCard(
                      "Donors",
                      "${users.where((u) => u['role'] == 'Donor').length}",
                      Icons.bloodtype,
                    ),
                    _buildStatCard(
                      "Recipients",
                      "${users.where((u) => u['role'] == 'Recipient').length}",
                      Icons.healing,
                    ),
                  ],
                ),
              ),

              // Users List
              Expanded(
                child: filteredUsers.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.people_outline,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              "No users found",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = filteredUsers[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: _getRoleColor(user['role']),
                                child: Text(
                                  user['name'][0].toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Text(
                                user['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("📧 ${user['email']}"),
                                  Text(
                                    "🩸 ${user['blood_group']} • ${user['role']}",
                                  ),
                                  Text("📍 ${user['location']}"),
                                  Text("📞 ${user['phone']}"),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getRoleColor(user['role']),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      user['role'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFFDB7093), size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFDB7093),
          ),
        ),
        Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Color _getRoleColor(String role) {
    switch (role) {
      case 'Donor':
        return Colors.green;
      case 'Recipient':
        return Colors.orange;
      case 'Hospital':
        return Colors.blue;
      case 'Blood Bank':
        return Colors.purple;
      default:
        return const Color(0xFFDB7093);
    }
  }
}
