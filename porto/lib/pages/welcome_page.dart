import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import 'profile_page.dart';

class WelcomePage extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDark;

  const WelcomePage({
    super.key,
    required this.toggleTheme,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final user = UserProfile(
      nama: "Anif Burhanudin",
      nim: "232552011075",
      jurusan: "Teknik Informatika",
      email: "jamananip@gmail.com",
      telepon: "0852-8406-5425",
      hobi: ["Memancing", "berkuda", "mengumpulkan pahala"],
      skills: ["Flutter", "Mikrotik", "network", "javva"],
      status: StatusMahasiswa.aktif,
      foto: "assets/images/profile.jpg",
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),

        // === GRADIENT THEME ===
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    const Color(0xFF0E0F1A),
                    const Color(0xFF121C2B),
                    const Color(0xFF0A0A0F),
                  ]
                : [
                    Colors.white,
                    Colors.blue.shade50,
                    Colors.indigo.shade100,
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ================= WELCOME TEXT =================
            AnimatedOpacity(
              opacity: 1,
              duration: const Duration(milliseconds: 900),
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: cs.onBackground,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Portfolio Mahasiswa",
              style: TextStyle(
                fontSize: 18,
                color: cs.onSurface.withOpacity(0.7),
              ),
            ),

            const SizedBox(height: 50),

            // ================= BUTTON PROFILE =================
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: cs.primary,
                foregroundColor: cs.onPrimary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 650),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 500),

                    // === PAGE + ANIMATION BUILDER ===
                    pageBuilder: (_, animation, __) {
                      final curved = CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      );

                      return FadeTransition(
                        opacity: curved,
                        child: ScaleTransition(
                          scale: Tween<double>(
                            begin: 0.94,
                            end: 1.0,
                          ).animate(curved),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.08),
                              end: Offset.zero,
                            ).animate(curved),
                            child: ProfilePage(user: user),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              child: const Text(
                "Lihat Profil",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 35),

            // ================= THEME SWITCH =================
            IconButton(
              iconSize: 34,
              color: cs.onBackground,
              icon: Icon(isDark ? Icons.wb_sunny : Icons.dark_mode),
              onPressed: toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}
