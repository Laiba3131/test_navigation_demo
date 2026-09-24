import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animations/animations.dart';
import '../widgets/animation_card.dart';
import 'detail_page.dart';
import 'package_demos/page_transition_demo.dart';
import 'package_demos/animations_package_demo.dart';
import 'package_demos/flutter_animate_demo.dart';
import 'package_demos/go_router_demo.dart';

class NavigationAnimationHome extends StatelessWidget {
  const NavigationAnimationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎨 Navigation Animations Pro'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.shade50,
              Colors.blue.shade50,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                '🚀 Choose Your Animation',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Built-in Flutter + Popular Packages',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // SECTION 1: Built-in Flutter Animations
            _buildSectionHeader('📱 Built-in Flutter Animations'),
            
            AnimationCard(
              title: '↗️ Slide Transition',
              subtitle: 'Slide from right to left',
              color: Colors.blue,
              icon: Icons.arrow_forward,
              onTap: () => _navigateWithSlide(context),
            ),
            AnimationCard(
              title: '🔄 Fade Transition',
              subtitle: 'Smooth opacity change',
              color: Colors.purple,
              icon: Icons.blur_on,
              onTap: () => _navigateWithFade(context),
            ),
            AnimationCard(
              title: '📏 Scale Transition',
              subtitle: 'Zoom in from center',
              color: Colors.teal,
              icon: Icons.zoom_in,
              onTap: () => _navigateWithScale(context),
            ),
            AnimationCard(
              title: '🌀 Rotation Transition',
              subtitle: 'Rotate while entering',
              color: Colors.orange,
              icon: Icons.rotate_right,
              onTap: () => _navigateWithRotation(context),
            ),
            AnimationCard(
              title: '⬆️ Slide Up Transition',
              subtitle: 'Slide from bottom',
              color: Colors.green,
              icon: Icons.arrow_upward,
              onTap: () => _navigateWithSlideUp(context),
            ),
            AnimationCard(
              title: '💫 Combined Animation',
              subtitle: 'Fade + Scale + Slide',
              color: Colors.pink,
              icon: Icons.auto_awesome,
              onTap: () => _navigateWithCombined(context),
            ),
            AnimationCard(
              title: '🎪 Flip Transition',
              subtitle: '3D flip animation',
              color: Colors.indigo,
              icon: Icons.flip,
              onTap: () => _navigateWithFlip(context),
            ),
            
            const SizedBox(height: 30),
            
            // SECTION 2: page_transition Package
            _buildSectionHeader('📦 page_transition Package'),
            
            AnimationCard(
              title: '🎯 Fade In',
              subtitle: 'page_transition: Fade',
              color: Colors.deepPurple,
              icon: Icons.brightness_5,
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: const DetailPage(
                    title: 'Fade In Transition',
                    color: Colors.deepPurple,
                    packageName: 'page_transition',
                  ),
                ),
              ),
            ),
            AnimationCard(
              title: '➡️ Right to Left',
              subtitle: 'page_transition: Right to Left',
              color: Colors.red,
              icon: Icons.keyboard_arrow_left,
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const DetailPage(
                    title: 'Right to Left',
                    color: Colors.red,
                    packageName: 'page_transition',
                  ),
                  duration: const Duration(milliseconds: 300),
                ),
              ),
            ),
            AnimationCard(
              title: '⬅️ Left to Right',
              subtitle: 'page_transition: Left to Right',
              color: Colors.amber,
              icon: Icons.keyboard_arrow_right,
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: const DetailPage(
                    title: 'Left to Right',
                    color: Colors.amber,
                    packageName: 'page_transition',
                  ),
                ),
              ),
            ),
            AnimationCard(
              title: '⬆️ Bottom to Top',
              subtitle: 'page_transition: Bottom to Top',
              color: Colors.lightGreen,
              icon: Icons.vertical_align_top,
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: const DetailPage(
                    title: 'Bottom to Top',
                    color: Colors.lightGreen,
                    packageName: 'page_transition',
                  ),
                ),
              ),
            ),
            AnimationCard(
              title: '⬇️ Top to Bottom',
              subtitle: 'page_transition: Top to Bottom',
              color: Colors.cyan,
              icon: Icons.vertical_align_bottom,
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.topToBottom,
                  child: const DetailPage(
                    title: 'Top to Bottom',
                    color: Colors.cyan,
                    packageName: 'page_transition',
                  ),
                ),
              ),
            ),
            AnimationCard(
              title: '🔄 Rotate',
              subtitle: 'page_transition: Rotation',
              color: Colors.deepOrange,
              icon: Icons.refresh,
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rotate,
                  alignment: Alignment.center,
                  child: const DetailPage(
                    title: 'Rotate Transition',
                    color: Colors.deepOrange,
                    packageName: 'page_transition',
                  ),
                  duration: const Duration(milliseconds: 600),
                ),
              ),
            ),
            AnimationCard(
              title: '⚡ Size',
              subtitle: 'page_transition: Size Expand',
              color: Colors.brown,
              icon: Icons.open_in_full,
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.size,
                  alignment: Alignment.center,
                  child: const DetailPage(
                    title: 'Size Transition',
                    color: Colors.brown,
                    packageName: 'page_transition',
                  ),
                ),
              ),
            ),
            AnimationCard(
              title: '🎪 Right to Left with Fade',
              subtitle: 'page_transition: Combined',
              color: Colors.blueGrey,
              icon: Icons.layers,
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: const DetailPage(
                    title: 'Right to Left with Fade',
                    color: Colors.blueGrey,
                    packageName: 'page_transition',
                  ),
                ),
              ),
            ),
            AnimationCard(
              title: '🌊 Left to Right with Fade',
              subtitle: 'page_transition: Combined',
              color: Colors.teal,
              icon: Icons.gradient,
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRightWithFade,
                  child: const DetailPage(
                    title: 'Left to Right with Fade',
                    color: Colors.teal,
                    packageName: 'page_transition',
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // SECTION 3: animations Package (Material Design)
            _buildSectionHeader('✨ animations Package (Material)'),
            
            AnimationCard(
              title: '🎭 Shared Axis (Horizontal)',
              subtitle: 'animations: SharedAxisTransition',
              color: Colors.indigo,
              icon: Icons.swap_horiz,
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const DetailPage(
                    title: 'Shared Axis Horizontal',
                    color: Colors.indigo,
                    packageName: 'animations',
                  ),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return SharedAxisTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                      child: child,
                    );
                  },
                ),
              ),
            ),
            AnimationCard(
              title: '📊 Shared Axis (Vertical)',
              subtitle: 'animations: SharedAxisTransition',
              color: Colors.purple,
              icon: Icons.swap_vert,
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const DetailPage(
                    title: 'Shared Axis Vertical',
                    color: Colors.purple,
                    packageName: 'animations',
                  ),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return SharedAxisTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.vertical,
                      child: child,
                    );
                  },
                ),
              ),
            ),
            AnimationCard(
              title: '🔍 Shared Axis (Scaled)',
              subtitle: 'animations: SharedAxisTransition',
              color: Colors.green,
              icon: Icons.zoom_out_map,
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const DetailPage(
                    title: 'Shared Axis Scaled',
                    color: Colors.green,
                    packageName: 'animations',
                  ),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return SharedAxisTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.scaled,
                      child: child,
                    );
                  },
                ),
              ),
            ),
            AnimationCard(
              title: '🎨 Fade Through',
              subtitle: 'animations: FadeThroughTransition',
              color: Colors.pinkAccent,
              icon: Icons.compare,
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const DetailPage(
                    title: 'Fade Through',
                    color: Colors.pinkAccent,
                    packageName: 'animations',
                  ),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeThroughTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      child: child,
                    );
                  },
                ),
              ),
            ),
            AnimationCard(
              title: '🎯 Fade Scale',
              subtitle: 'animations: FadeScaleTransition',
              color: Colors.orangeAccent,
              icon: Icons.center_focus_strong,
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const DetailPage(
                    title: 'Fade Scale',
                    color: Colors.orangeAccent,
                    packageName: 'animations',
                  ),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeScaleTransition(
                      animation: animation,
                      child: child,
                    );
                  },
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // SECTION 4: More Demos
            _buildSectionHeader('🎪 Interactive Demos'),
            
            AnimationCard(
              title: '🎬 All page_transition Types',
              subtitle: 'Complete showcase demo',
              color: Colors.deepPurple,
              icon: Icons.view_carousel,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageTransitionDemoScreen(),
                ),
              ),
            ),
            AnimationCard(
              title: '✨ Material Animations Gallery',
              subtitle: 'animations package showcase',
              color: Colors.blue,
              icon: Icons.auto_awesome,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnimationsPackageDemoScreen(),
                ),
              ),
            ),
            AnimationCard(
              title: '🚀 Flutter Animate Effects',
              subtitle: 'flutter_animate package demos',
              color: Colors.pink,
              icon: Icons.animation,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FlutterAnimateDemoScreen(),
                ),
              ),
            ),
            
            const SizedBox(height: 30),

            // SECTION 5: go_router Package
            _buildSectionHeader('🔀 go_router Package'),

            AnimationCard(
              title: '↗️ Slide Transition',
              subtitle: 'go_router: CustomTransitionPage slide',
              color: Colors.blue,
              icon: Icons.arrow_forward,
              onTap: () => _openGoRouterDemo(context, 'slide'),
            ),
            AnimationCard(
              title: '🌫️ Fade Transition',
              subtitle: 'go_router: CustomTransitionPage fade',
              color: Colors.purple,
              icon: Icons.blur_on,
              onTap: () => _openGoRouterDemo(context, 'fade'),
            ),
            AnimationCard(
              title: '🔍 Scale Transition',
              subtitle: 'go_router: CustomTransitionPage scale',
              color: Colors.teal,
              icon: Icons.zoom_in,
              onTap: () => _openGoRouterDemo(context, 'scale'),
            ),
            AnimationCard(
              title: '⬆️ Slide Up',
              subtitle: 'go_router: bottom se upar',
              color: Colors.green,
              icon: Icons.arrow_upward,
              onTap: () => _openGoRouterDemo(context, 'slide-up'),
            ),
            AnimationCard(
              title: '💫 Combined',
              subtitle: 'go_router: Fade + Scale + Slide',
              color: Colors.pink,
              icon: Icons.auto_awesome,
              onTap: () => _openGoRouterDemo(context, 'combined'),
            ),
            AnimationCard(
              title: '⚡ No Transition',
              subtitle: 'go_router: NoTransitionPage',
              color: Colors.blueGrey,
              icon: Icons.flash_on,
              onTap: () => _openGoRouterDemo(context, 'no-anim'),
            ),
            AnimationCard(
              title: '🎭 Shared Axis Style',
              subtitle: 'go_router: Material-style fade+slide',
              color: Colors.indigo,
              icon: Icons.swap_horiz,
              onTap: () => _openGoRouterDemo(context, 'shared-axis'),
            ),
            AnimationCard(
              title: '📋 Nested Routes Demo',
              subtitle: 'go_router: List → Detail deep linking',
              color: Colors.orange,
              icon: Icons.account_tree,
              onTap: () => _openGoRouterDemo(context, 'list'),
            ),
            AnimationCard(
              title: '🗺️ All go_router Animations',
              subtitle: 'Complete go_router showcase',
              color: const Color(0xFF1565C0),
              icon: Icons.route,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const _GoRouterShell(),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  // Built-in Flutter Navigation Methods
  void _navigateWithSlide(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DetailPage(title: 'Slide Transition', color: Colors.blue),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void _navigateWithFade(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DetailPage(title: 'Fade Transition', color: Colors.purple),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  void _navigateWithScale(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DetailPage(title: 'Scale Transition', color: Colors.teal),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            ),
            child: child,
          );
        },
      ),
    );
  }

  void _navigateWithRotation(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DetailPage(title: 'Rotation Transition', color: Colors.orange),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return RotationTransition(
            turns: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            ),
            child: child,
          );
        },
      ),
    );
  }

  void _navigateWithSlideUp(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DetailPage(title: 'Slide Up Transition', color: Colors.green),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void _navigateWithCombined(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DetailPage(title: 'Combined Animation', color: Colors.pink),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          
          var slideTween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeIn),
          );
          var scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          );

          return SlideTransition(
            position: animation.drive(slideTween),
            child: FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateWithFlip(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DetailPage(title: 'Flip Transition', color: Colors.indigo),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final angle = animation.value * 3.14159; // π radians
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(angle),
                alignment: Alignment.center,
                child: child,
              );
            },
            child: child,
          );
        },
      ),
    );
  }

  // go_router: Opens GoRouter demo using a nested Navigator shell
  void _openGoRouterDemo(BuildContext context, String subRoute) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _GoRouterShell(initialSubRoute: subRoute),
      ),
    );
  }
}

// ─── GoRouter Shell ───────────────────────────────────────────────────────────
// MaterialApp.router wraps our GoRouter so it can run inside the main app.
class _GoRouterShell extends StatelessWidget {
  final String? initialSubRoute;
  const _GoRouterShell({this.initialSubRoute});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: initialSubRoute != null
          ? '${GoRoutes.home}/$initialSubRoute'
          : GoRoutes.home,
      routes: goRouterInstance.configuration.routes,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
