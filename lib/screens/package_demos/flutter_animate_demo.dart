import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../utils/color_extensions.dart';

class FlutterAnimateDemoScreen extends StatefulWidget {
  const FlutterAnimateDemoScreen({super.key});

  @override
  State<FlutterAnimateDemoScreen> createState() =>
      _FlutterAnimateDemoScreenState();
}

class _FlutterAnimateDemoScreenState extends State<FlutterAnimateDemoScreen> {
  bool _showEffects = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🚀 flutter_animate Package'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_showEffects ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _showEffects = !_showEffects;
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.pink.shade50, Colors.orange.shade50],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Tap the eye icon to replay animations',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Fade Effect
            if (_showEffects)
              _buildEffectCard(
                'Fade Effect',
                Colors.purple,
                Icons.opacity,
              ).animate().fadeIn(duration: 1000.ms),
            
            const SizedBox(height: 16),
            
            // Slide Effect
            if (_showEffects)
              _buildEffectCard(
                'Slide Effect',
                Colors.blue,
                Icons.arrow_forward,
              ).animate().slideX(
                begin: -1,
                end: 0,
                duration: 800.ms,
                curve: Curves.easeOutBack,
              ),
            
            const SizedBox(height: 16),
            
            // Scale Effect
            if (_showEffects)
              _buildEffectCard(
                'Scale Effect',
                Colors.green,
                Icons.zoom_in,
              ).animate().scale(
                begin: const Offset(0, 0),
                end: const Offset(1, 1),
                duration: 800.ms,
                curve: Curves.elasticOut,
              ),
            
            const SizedBox(height: 16),
            
            // Shimmer Effect
            if (_showEffects)
              _buildEffectCard(
                'Shimmer Effect',
                Colors.orange,
                Icons.auto_awesome,
              ).animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 2000.ms, color: Colors.white),
            
            const SizedBox(height: 16),
            
            // Shake Effect
            if (_showEffects)
              _buildEffectCard(
                'Shake Effect',
                Colors.red,
                Icons.vibration,
              ).animate(onPlay: (controller) => controller.repeat())
                .shake(duration: 1000.ms, hz: 4),
            
            const SizedBox(height: 16),
            
            // Flip Effect
            if (_showEffects)
              _buildEffectCard(
                'Flip Effect',
                Colors.teal,
                Icons.flip,
              ).animate().flip(
                duration: 800.ms,
                curve: Curves.easeInOut,
              ),
            
            const SizedBox(height: 16),
            
            // Blur Effect
            if (_showEffects)
              _buildEffectCard(
                'Blur Effect',
                Colors.indigo,
                Icons.blur_on,
              ).animate().blur(
                begin: const Offset(20, 20),
                end: const Offset(0, 0),
                duration: 1000.ms,
              ),
            
            const SizedBox(height: 16),
            
            // Multiple Combined Effects
            if (_showEffects)
              _buildEffectCard(
                'Combined: Fade + Scale + Slide',
                Colors.pinkAccent,
                Icons.layers,
              )
                .animate()
                .fadeIn(duration: 600.ms)
                .then()
                .scale(duration: 400.ms, curve: Curves.easeOutBack)
                .then()
                .slideY(begin: -0.3, end: 0, duration: 400.ms),
            
            const SizedBox(height: 16),
            
            // Rotate Effect
            if (_showEffects)
              _buildEffectCard(
                'Rotate Effect',
                Colors.deepOrange,
                Icons.rotate_right,
              ).animate().rotate(
                begin: 0,
                end: 1,
                duration: 800.ms,
                curve: Curves.easeInOut,
              ),
            
            const SizedBox(height: 16),
            
            // Elevation/Shadow Effect
            if (_showEffects)
              _buildEffectCard(
                'Elevation Effect',
                Colors.cyan,
                Icons.layers_outlined,
              ).animate().elevation(
                begin: 0,
                end: 16,
                duration: 800.ms,
                curve: Curves.easeInOut,
              ),
            
            const SizedBox(height: 16),
            
            // Tint Effect
            if (_showEffects)
              _buildEffectCard(
                'Tint Effect',
                Colors.lime,
                Icons.color_lens,
              ).animate().tint(
                color: Colors.purple,
                duration: 1000.ms,
              ),
            
            const SizedBox(height: 16),
            
            // Complex Chain
            if (_showEffects)
              _buildEffectCard(
                'Complex Chain Animation',
                Colors.amber,
                Icons.auto_awesome_motion,
              )
                .animate()
                .fadeIn(duration: 300.ms)
                .scale(delay: 300.ms, duration: 400.ms)
                .then(delay: 200.ms)
                .shake(hz: 5, duration: 500.ms)
                .then()
                .shimmer(duration: 800.ms),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _showEffects = false;
          });
          Future.delayed(const Duration(milliseconds: 50), () {
            if (mounted) {
              setState(() {
                _showEffects = true;
              });
            }
          });
        },
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.replay),
        label: const Text('Replay All'),
      ).animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scale(duration: 1000.ms, begin: const Offset(1, 1), end: const Offset(1.1, 1.1)),
    );
  }

  Widget _buildEffectCard(String title, Color color, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [color.shade100, color.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color.shade900,
                ),
              ),
            ),
            Icon(Icons.play_circle, color: color.shade400, size: 32),
          ],
        ),
      ),
    );
  }
}
