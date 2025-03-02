import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennaxia_geolocation/src/app/routes/app_router.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: const Center(
        child: Text('This is the user profile view'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Profile tab is selected
        onTap: (index) {
          if (index == 0) {
            context.goNamed(AppRoute.homeProducer.name);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
