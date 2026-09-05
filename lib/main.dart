import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harini T Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Harini T',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
            child: const Text('About'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProjectsPage(),
                ),
              );
            },
            child: const Text('Projects'),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical: 50,
              ),
              child: isMobile
                  ? const Column(
                      children: [
                        ProfileSection(),
                        SizedBox(height: 40),
                        SkillsSection(),
                      ],
                    )
                  : const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: ProfileSection()),
                        SizedBox(width: 70),
                        Expanded(child: SkillsSection()),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 55,
          child: Icon(
            Icons.person,
            size: 65,
          ),
        ),
        const SizedBox(height: 28),
        Text(
          'Hello, I am Harini T',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'Aspiring Software Engineer',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.indigo,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 18),
        const Text(
          'I am a third-year CSE AIML student at CR Rao AIMSCS, '
          'passionate about using technology and artificial intelligence '
          'to solve real-world problems.',
          style: TextStyle(
            fontSize: 17,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 25),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Chip(
              avatar: const Icon(Icons.location_on, size: 18),
              label: const Text('Hyderabad'),
            ),
            const Chip(
              label: Text('CSE AIML'),
            ),
            const Chip(
              label: Text('3rd Year'),
            ),
          ],
        ),
        const SizedBox(height: 28),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProjectsPage(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_forward),
          label: const Text('View Sample Projects'),
        ),
      ],
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Skills',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            const SkillTile(
              icon: Icons.code,
              title: 'Python',
              description: 'Programming and problem solving',
            ),
            const SkillTile(
              icon: Icons.language,
              title: 'HTML',
              description: 'Building web page structures',
            ),
            const SkillTile(
              icon: Icons.palette,
              title: 'CSS',
              description: 'Designing responsive interfaces',
            ),
            const SkillTile(
              icon: Icons.smart_toy,
              title: 'Artificial Intelligence',
              description: 'Exploring AI for real-world applications',
            ),
          ],
        ),
      ),
    );
  }
}

class SkillTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const SkillTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.indigo,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 850),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Me',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'I am Harini T, a third-year Computer Science and '
                  'Engineering student specializing in Artificial Intelligence '
                  'and Machine Learning at CR Rao AIMSCS.',
                  style: TextStyle(fontSize: 18, height: 1.6),
                ),
                const SizedBox(height: 18),
                const Text(
                  'My goal is to become a software engineer and create '
                  'useful technology that solves real-world problems. '
                  'I am currently improving my programming, web development, '
                  'and artificial intelligence skills.',
                  style: TextStyle(fontSize: 18, height: 1.6),
                ),
                const SizedBox(height: 30),
                Text(
                  'Education',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.school, color: Colors.indigo),
                  title: Text('CR Rao AIMSCS'),
                  subtitle: Text(
                    'B.Tech CSE - Artificial Intelligence and Machine Learning\n'
                    'Third Year',
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Interests',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                const Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Chip(label: Text('Artificial Intelligence')),
                    Chip(label: Text('Software Development')),
                    Chip(label: Text('Problem Solving')),
                    Chip(label: Text('Real-World Applications')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  final List<Project> projects = const [
    Project(
      title: 'Calculator App',
      description:
          'A simple calculator application designed to perform basic arithmetic operations.',
      icon: Icons.calculate,
      technologies: ['Flutter', 'Dart'],
    ),
    Project(
      title: 'Weather App',
      description:
          'A sample weather application that displays weather information in a simple interface.',
      icon: Icons.cloud,
      technologies: ['Flutter', 'API'],
    ),
    Project(
      title: 'To-Do App',
      description:
          'A task management application that helps users organize and track daily activities.',
      icon: Icons.check_circle,
      technologies: ['Flutter', 'Dart'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Projects'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int columns = 1;

          if (constraints.maxWidth >= 900) {
            columns = 3;
          } else if (constraints.maxWidth >= 600) {
            columns = 2;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sample Projects',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'These are example projects displayed to demonstrate '
                      'my learning and development interests.',
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 28),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: projects.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        return ProjectCard(project: projects[index]);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final IconData icon;
  final List<String> technologies;

  const Project({
    required this.title,
    required this.description,
    required this.icon,
    required this.technologies,
  });
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              project.icon,
              size: 48,
              color: Colors.indigo,
            ),
            const SizedBox(height: 18),
            Text(
              project.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                project.description,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.technologies
                  .map(
                    (technology) => Chip(
                      label: Text(technology),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}