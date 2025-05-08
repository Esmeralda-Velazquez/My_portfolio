import 'package:flutter/material.dart';

class ColumnDos extends StatelessWidget {
  final PageController pageController;

  ColumnDos({super.key, required this.pageController});

  final List<Map<String, String>> experiences = [
    {
      'empresa': 'Empresa 1',
      'puesto': 'Puesto 1',
      'tiempo': 'Enero 2019 - Actualidad',
      'actividades': 'Desarrollo de aplicaciones móviles, pruebas de software.'
    },
    {
      'empresa': 'Empresa 2',
      'puesto': 'Puesto 2',
      'tiempo': 'Marzo 2017 - Diciembre 2018',
      'actividades': 'Mantenimiento de sistemas backend, integración de APIs.'
    },
  ];

  final List<Map<String, dynamic>> skills = [
    {'image': 'assets/css.png', 'color': Colors.transparent, 'name': 'css'},
    {
      'image': 'assets/flutter.png',
      'color': Colors.transparent,
      'name': 'Flutter'
    },
    {'image': 'assets/html.png', 'color': Colors.transparent, 'name': 'HTML'},
    {
      'image': 'assets/python.png',
      'color': Colors.transparent,
      'name': 'Python'
    },
    {'image': 'assets/java.png', 'color': Colors.transparent, 'name': 'Java'},
    {'image': 'assets/php.png', 'color': Colors.transparent, 'name': 'PHP'},
    {
      'image': 'assets/javascript.png',
      'color': Colors.transparent,
      'name': 'Java Script'
    },
    {
      'image': 'assets/netcore.png',
      'color': Colors.transparent,
      'name': '.NET Core'
    },
    {
      'image': 'assets/github.png',
      'color': Colors.transparent,
      'name': 'GitHub'
    },
    {
      'image': 'assets/android.png',
      'color': Colors.transparent,
      'name': 'Android Studio'
    },
    {'image': 'assets/mysql.png', 'color': Colors.transparent, 'name': 'MySQL'},
    {'image': 'assets/xcode.png', 'color': Colors.transparent, 'name': 'xCode'},
    {'image': 'assets/c#.png', 'color': Colors.transparent, 'name': 'C#'},
  ];

  final List<Map<String, dynamic>> projects = [
    {
      'name': 'Portfolio Website',
      'shortDescription': 'A personal portfolio showcasing my skills.',
      'details': 'Built using Flutter for web, showcasing responsive design.',
      'technologies': ['Flutter', 'Dart', 'Firebase'],
    },
    {
      'name': 'E-commerce App',
      'shortDescription': 'A mobile shopping app for a local store.',
      'details':
          'Implemented user authentication, cart functionality, and payment integration.',
      'technologies': ['Flutter', 'Stripe API', 'Node.js'],
    },
    {
      'name': 'E-commerce App',
      'shortDescription': 'A mobile shopping app for a local store.',
      'details':
          'Implemented user authentication, cart functionality, and payment integration.',
      'technologies': ['Flutter', 'Stripe API', 'Node.js'],
    },
    {
      'name': 'E-commerce App',
      'shortDescription': 'A mobile shopping app for a local store.',
      'details':
          'Implemented user authentication, cart functionality, and payment integration.',
      'technologies': ['Flutter', 'Stripe API', 'Node.js'],
    },
    {
      'name': 'E-commerce App',
      'shortDescription': 'A mobile shopping app for a local store.',
      'details':
          'Implemented user authentication, cart functionality, and payment integration.',
      'technologies': ['Flutter', 'Stripe API', 'Node.js'],
    },
    {
      'name': 'E-commerce App',
      'shortDescription': 'A mobile shopping app for a local store.',
      'details':
          'Implemented user authentication, cart functionality, and payment integration.',
      'technologies': ['Flutter', 'Stripe API', 'Node.js'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: PageView(
        controller: pageController,
        children: [
          about(),
          experienceCard(),
          projectsCards(),
          skillsImg(),
        ],
      ),
    );
  }

  Center skillsImg() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'SKILLS',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  final skill = skills[index];
                  return SkillImage(skill: skill);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center experienceCard() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: experiences.length,
          itemBuilder: (context, index) {
            final experience = experiences[index];
            return Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience['empresa']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      experience['puesto']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      experience['tiempo']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      experience['actividades']!,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Center projectsCards() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: ExpansionTile(
                title: Text(
                  project['name'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(project['shortDescription']),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project['details'],
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Technologies: ${project['technologies'].join(', ')}',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Center about() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Back in 2012, I decided to try my hand at creating custom Tumblr themes and tumbled head first into the rabbit hole of coding and web development. Fast-forward to today, and I’ve had the privilege of building software for an advertising agency, a start-up, a huge corporation, and a digital product studio. My main focus these days is building accessible user interfaces for our customers at Klaviyo. I most enjoy building software in the sweet spot where design and engineering meet — things that look good but are also built well under the hood. In my free time, I’ve also released an online video course that covers everything you need to know to build a web app with the Spotify API. When I’m not at the computer, I’m usually rock climbing, reading, hanging out with my wife and two cats, or running around Hyrule searching for Korok seeds.',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class SkillImage extends StatefulWidget {
  final Map<String, dynamic> skill;

  SkillImage({required this.skill});

  @override
  _SkillImageState createState() => _SkillImageState();
}

class _SkillImageState extends State<SkillImage> {
  late bool _isHovered;

  @override
  void initState() {
    super.initState();
    _isHovered = false;
  }

  void _onEnter() {
    setState(() {
      _isHovered = true;
    });
  }

  void _onExit() {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEnter(),
      onExit: (_) => _onExit(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            _isHovered ? Colors.transparent : Colors.grey,
            _isHovered ? BlendMode.dst : BlendMode.saturation,
          ),
          child: Image.asset(
            widget.skill['image'],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
