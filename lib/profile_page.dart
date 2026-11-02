import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String userName = 'Given Keo';
  final String role = 'Mahasiswa Software Engineering';

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
            
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pengalaman',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  final exp = experiences[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const Icon(Icons.work, color: Colors.blueAccent),
                      title: Text(exp['title']!),
                      subtitle: Text('${exp['company']} • ${exp['year']}'),
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
}


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