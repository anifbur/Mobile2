import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../widgets/info_card.dart';
import '../widgets/hobby_item.dart';
import '../widgets/skill_item.dart';
import '../widgets/contact_card.dart';
import '../widgets/about_me_card.dart'; // ✅ IMPORT BARU

class ProfilePage extends StatelessWidget {
  final UserProfile user;

  const ProfilePage({super.key, required this.user});

  void _showAboutMe(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AboutMeCard(user: user), // ✅ PAKAI WIDGET TERPISAH
    );
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onBackground;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAboutMe(context),
        backgroundColor: isDark ? Colors.indigo : Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
        mini: true,
        child: const Icon(Icons.info_outline, size: 20),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAvatar(context),
              const SizedBox(height: 20),
              _buildNameNIM(context),
              const SizedBox(height: 24),
              _buildInfoSection(),
              const SizedBox(height: 20),
              _buildHobiSection(context),
              const SizedBox(height: 20),
              _buildSkillSection(context),
              const SizedBox(height: 30),
              _buildContactSection(context),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  // ===================== AVATAR =====================
  Widget _buildAvatar(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      Colors.blue.shade700,
                      Colors.indigo.shade600,
                      Colors.purple.shade600,
                    ]
                  : [
                      Colors.blue.shade400,
                      Colors.indigo.shade300,
                      Colors.purple.shade300,
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: isDark 
                    ? Colors.blueAccent.withOpacity(0.4)
                    : Colors.blueAccent.withOpacity(0.3),
                blurRadius: 25,
                spreadRadius: 4,
              )
            ],
          ),
        ),

        Container(
          width: 165,
          height: 165,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
          ),
        ),

        ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Container(
            width: 150,
            height: 150,
            color: isDark 
                ? Colors.black.withOpacity(0.3)
                : Colors.white.withOpacity(0.3),
            child: user.foto.isNotEmpty
                ? Image.asset(user.foto, fit: BoxFit.cover)
                : Icon(
                    Icons.person, 
                    size: 80, 
                    color: isDark ? Colors.white70 : Colors.blueGrey.shade700,
                  ),
          ),
        ),
      ],
    );
  }

  // ===================== NAME + NIM =====================
  Widget _buildNameNIM(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onBackground;

    return Column(
      children: [
        Text(
          user.nama,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          user.nim,
          style: TextStyle(
            color: textColor.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  // ===================== INFO SECTION =====================
  Widget _buildInfoSection() {
    return Column(
      children: [
        InfoCard(icon: Icons.school, label: user.jurusan),
        InfoCard(icon: Icons.email, label: user.email),
        InfoCard(icon: Icons.phone, label: user.telepon),
        InfoCard(icon: Icons.badge, label: "Status: ${user.getStatusString()}"),
      ],
    );
  }

  // ===================== HOBI SECTION (GRIDVIEW) =====================
  Widget _buildHobiSection(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onBackground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hobi",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 14),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: user.hobi.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.0,
          ),
          itemBuilder: (context, index) {
            return HobbyItem(hobby: user.hobi[index]);
          },
        ),
      ],
    );
  }

  // ===================== SKILL SECTION (LISTVIEW) =====================
  Widget _buildSkillSection(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onBackground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skill",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 14),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: user.skills.length,
          itemBuilder: (context, index) {
            return SkillItem(skill: user.skills[index]);
          },
        ),
      ],
    );
  }

  // ===================== CONTACT SECTION =====================
  Widget _buildContactSection(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onBackground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 14),

        Column(
          children: [
            ContactCard(
              icon: Icons.code,
              label: "GitHub",
              url: "https://github.com/anifbur",
            ),
            const SizedBox(height: 12),
            ContactCard(
              icon: Icons.business_center,
              label: "LinkedIn",
              url: "https://www.linkedin.com/in/Anif-Burhanudin/",
            ),
            const SizedBox(height: 12),
            ContactCard(
              icon: Icons.camera_alt,
              label: "Instagram",
              url: "https://instagram.com/anifburhan",
            ),
          ],
        ),
      ],
    );
  }
}