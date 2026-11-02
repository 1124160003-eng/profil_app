import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String userName = 'Given Keo';
  final String role = 'Mahasiswa Software Engineering';

  // --- DATA DUMMY PENGALAMAN ---
  final List> experiences = const [
    {
      'title': 'Backend Developer Intern',
      'company': 'Tech Corp',
      'year': '2025',
    },
    {
      'title': 'Flutter Mobile App Developer',
      'company': 'Freelance',
      'year': '2024',
    },
    {
      'title': 'Database Administrator Assistant',
      'company': 'Kampus',
      'year': '2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const ProfileAvatar(),
            const SizedBox(height: 16),
            ProfileInfo(
              name: userName,
              role: role,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Edit Profil'),
            ),
            const SizedBox(height: 24),
            const ProfileStats(),
            const SizedBox(height: 24),
            
            // --- JUDUL SECTION PENGALAMAN ---
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pengalaman',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),

            // --- LISTVIEW MENGGUNAKAN WIDGET EXPERIENCE CARD ---
            Expanded(
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  final exp = experiences[index];
                  return ExperienceCard(
                    title: exp['title']!,
                    company: exp['company']!,
                    year: exp['year']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== CUSTOM WIDGETS ====================

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey,
      child: Icon(Icons.person, size: 50, color: Colors.white),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.name,
    required this.role,
  });

  final String name;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          role,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatItem(value: '12', label: 'Proyek'),
        StatItem(value: '1.2K', label: 'Followers'),
        StatItem(value: '350', label: 'Following'),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

/// Widget mandiri yang diekstrak untuk kartu pengalaman kerja
class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    super.key,
    required this.title,
    required this.company,
    required this.year,
  });

  final String title;
  final String company;
  final String year;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Memberikan efek bayangan lembut
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.work, color: Colors.white, size: 20),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('$company • $year'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ),
      ),
    );
  }
}