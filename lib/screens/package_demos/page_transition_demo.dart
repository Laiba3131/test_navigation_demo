import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../utils/color_extensions.dart';
import '../detail_page.dart';

class PageTransitionDemoScreen extends StatelessWidget {
  const PageTransitionDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📦 page_transition Package'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple.shade50, Colors.pink.shade50],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildTransitionCard(
              context,
              'Fade',
              Icons.brightness_5,
              Colors.purple,
              PageTransitionType.fade,
            ),
            _buildTransitionCard(
              context,
              'Right to Left',
              Icons.arrow_back,
              Colors.blue,
              PageTransitionType.rightToLeft,
            ),
            _buildTransitionCard(
              context,
              'Left to Right',
              Icons.arrow_forward,
              Colors.green,
              PageTransitionType.leftToRight,
            ),
            _buildTransitionCard(
              context,
              'Top to Bottom',
              Icons.arrow_downward,
              Colors.orange,
              PageTransitionType.topToBottom,
            ),
            _buildTransitionCard(
              context,
              'Bottom to Top',
              Icons.arrow_upward,
              Colors.teal,
              PageTransitionType.bottomToTop,
            ),
            _buildTransitionCard(
              context,
              'Scale',
              Icons.zoom_in,
              Colors.pink,
              PageTransitionType.scale,
            ),
            _buildTransitionCard(
              context,
              'Rotate',
              Icons.rotate_right,
              Colors.red,
              PageTransitionType.rotate,
            ),
            _buildTransitionCard(
              context,
              'Size',
              Icons.open_in_full,
              Colors.indigo,
              PageTransitionType.size,
            ),
            _buildTransitionCard(
              context,
              'Right + Fade',
              Icons.layers,
              Colors.cyan,
              PageTransitionType.rightToLeftWithFade,
            ),
            _buildTransitionCard(
              context,
              'Left + Fade',
              Icons.gradient,
              Colors.amber,
              PageTransitionType.leftToRightWithFade,
            ),
            _buildTransitionCard(
              context,
              'Right Pop',
              Icons.keyboard_tab,
              Colors.lime,
              PageTransitionType.rightToLeftPop,
            ),
            _buildTransitionCard(
              context,
              'Left Pop',
              Icons.tab,
              Colors.lightGreen,
              PageTransitionType.leftToRightPop,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransitionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    PageTransitionType type,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: type,
              child: DetailPage(
                title: title,
                color: color,
                packageName: 'page_transition',
              ),
              duration: const Duration(milliseconds: 400),
              alignment: Alignment.center,
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.shade100, color.shade200],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color.shade700),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color.shade900,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
