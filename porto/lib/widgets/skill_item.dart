import 'package:flutter/material.dart';

class SkillItem extends StatelessWidget {
  final String skill;

  const SkillItem({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8), // JARAK VERTICAL DIPERBESAR
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14), // PADDING DIPERBESAR
      decoration: BoxDecoration(
        color: isDark 
            ? Colors.indigo.withOpacity(0.3)
            : Colors.indigo.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark 
              ? Colors.indigo.withOpacity(0.5)
              : Colors.indigo.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: isDark ? Colors.indigoAccent : Colors.indigo,
            size: 20, // ICON SIZE DIPERBESAR
          ),
          const SizedBox(width: 14), // SPACING DIPERBESAR
          Expanded(
            child: Text(
              skill,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 15, // FONT SIZE DIPERBESAR
              ),
            ),
          ),
        ],
      ),
    );
  }
}