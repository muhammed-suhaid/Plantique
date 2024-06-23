import 'package:flutter/material.dart';
import 'package:plantique/services/auth_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void logout() async {
    try {
      final authService = AuthService();

      await authService.signOut();
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 25,
              ),
              child: InkWell(
                onTap: logout,
                child: const SizedBox(
                  child: Row(
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.logout),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
