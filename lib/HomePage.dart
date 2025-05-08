import 'package:flutter/material.dart';
import 'package:portafolio_esme/column_dos.dart';
import 'package:portafolio_esme/column_uno.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portafolio_esme/core/app_colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.grey[900],
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return isMobile ? _buildMobileLayout() : _buildDesktopLayout();
            },
          ),
        ],
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }


  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          child: ColumnUno(
            pageController: _pageController,
            selectedPage: selectedPage,
            onMenuItemSelected: (int page) {
              setState(() {
                selectedPage = page;
                _pageController.animateToPage(
                  page,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
          ),
        ),
        Expanded(
          child: ColumnDos(pageController: _pageController),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ColumnUno(
            pageController: _pageController,
            selectedPage: selectedPage,
            onMenuItemSelected: (int page) {
              setState(() {
                selectedPage = page;
                _pageController.animateToPage(
                  page,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: ColumnDos(pageController: _pageController),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2025 Esmeralda Velazquez',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
          ElevatedButton(
            onPressed: () => _showContactDialog(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: Text(
              '¡Contáctame!',
              style: TextStyle(color: AppColors.background, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _showContactDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          title: Text(
            '¡Contáctame!',
            style: TextStyle(color: AppColors.background),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _contactButton(
                icon: Icons.email,
                label: 'esmeralda@example.com',
                url: 'mailto:esmeralda@example.com?subject=Hello%20Esmeralda!',
              ),
              _contactButton(
                icon: Icons.phone,
                label: '+52 123 456 7890',
                url: 'tel:+521234567890',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cerrar',
                style: TextStyle(color: AppColors.secondary),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _contactButton({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
    );
  }
}
