import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfileApp());
}

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      debugShowCheckedModeBanner: false,
      home: const StudentProfilePage(),
    );
  }
}

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  bool showAcademic = true;
  int supportCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/purple_mj.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF2C0A3D).withOpacity(0.45),
                const Color(0xFF1A0528).withOpacity(0.65),
                const Color(0xFF12031C).withOpacity(0.78),
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // App bar row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Student Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          supportCount = supportCount + 1;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Liked · $supportCount'),
                            backgroundColor: const Color(0xFF8E44AD),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      icon: const Icon(Icons.favorite, color: Color(0xFFF5B7B1)),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Profile picture
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFBB8FCE), width: 3),
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/yesha.jpg'),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Hardcoded personal name
                const Text(
                  'Yeshabelle M. Olango',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '"Yesha"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 14),

                // Course chips
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    chipWidget('BS Information Technology'),
                    chipWidget('3rd Year'),
                    chipWidget('3 IT-B'),
                  ],
                ),
                const SizedBox(height: 22),

                // Motto card
                Card(
                  color: Colors.white.withOpacity(0.18),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: Colors.white.withOpacity(0.28)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.auto_awesome, color: Color(0xFFBB8FCE), size: 22),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'What you believe, you become.',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                              color: Colors.white.withOpacity(0.95),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 22),

                // Personal Information section title
                sectionTitle(Icons.badge_outlined, 'Personal Information'),
                const SizedBox(height: 12),

                // Age and Birthday
                Row(
                  children: [
                    Expanded(
                      child: statCard(Icons.cake_outlined, 'Age', '20'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: statCard(
                        Icons.calendar_month_outlined,
                        'Birthday',
                        'June 29, 2006',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                infoCard(Icons.home_outlined, 'Address', 'City of Cabuyao, Laguna'),
                const SizedBox(height: 12),
                infoCard(Icons.interests_outlined, 'Hobby', 'Coding, drawing and music'),
                const SizedBox(height: 12),
                infoCard(Icons.school_outlined, 'Course', 'BS Information Technology'),
                const SizedBox(height: 12),
                infoCard(Icons.groups_outlined, 'Year & Section', '3rd Year · 3 IT-B'),
                const SizedBox(height: 26),

                // Academic Information
                Row(
                  children: [
                    Expanded(
                      child: sectionTitle(
                        Icons.menu_book_outlined,
                        'Academic Information',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showAcademic = !showAcademic;
                        });
                      },
                      child: Text(
                        showAcademic ? 'Hide' : 'Show',
                        style: const TextStyle(
                          color: Color(0xFFE8DAEF),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),

                if (showAcademic) ...[
                  const SizedBox(height: 8),
                  infoCard(
                    Icons.star_outline,
                    'Favorite Subject',
                    'Mobile Application Development',
                  ),
                  const SizedBox(height: 10),
                  infoCard(
                    Icons.code,
                    'Programming Language',
                    'Dart / Flutter, Java, SQL',
                  ),
                  const SizedBox(height: 10),
                  infoCard(
                    Icons.build_outlined,
                    'Technical Skill',
                    'UI design, networking, databases',
                  ),
                  const SizedBox(height: 10),
                  infoCard(
                    Icons.flag_outlined,
                    'Career Goal',
                    'Mobile & systems developer',
                  ),
                  const SizedBox(height: 10),
                  infoCard(
                    Icons.lightbulb_outline,
                    'Academic Interest',
                    'App development & system integration',
                  ),
                ],

                const SizedBox(height: 28),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('About'),
                                content: const Text(
                                  'ITP107 Midterm Lab 2 — Interactive Student Profile.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Close',
                                      style: TextStyle(color: Color(0xFF8E44AD)),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.info_outline, size: 18),
                        label: const Text('About'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5B2C6F),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            supportCount = supportCount + 1;
                          });
                        },
                        icon: const Icon(Icons.thumb_up_alt_outlined, size: 18),
                        label: Text('Support · $supportCount'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Color(0xFFBB8FCE), width: 1.5),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    'University of Cabuyao · ITP107',
                    style: TextStyle(fontSize: 11, color: Color(0xFFD7C6E6)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widgets
  Widget chipWidget(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.35)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget sectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFFBB8FCE)),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget statCard(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.16),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: const Color(0xFFBB8FCE)),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.75)),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget infoCard(IconData icon, String label, String value) {
    return Card(
      color: Colors.white.withOpacity(0.16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.white.withOpacity(0.25)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: const Color(0xFFBB8FCE), size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}