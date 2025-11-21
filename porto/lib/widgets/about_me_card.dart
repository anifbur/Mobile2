import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class AboutMeCard extends StatelessWidget {
  final UserProfile user;

  const AboutMeCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Tentang Saya",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Text(
            "Saya ${user.nama} bisa sagala bisa di bisa-bisa, Tapi alhamdulillah bisa.",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}