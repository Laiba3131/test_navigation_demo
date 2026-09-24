import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../utils/color_extensions.dart';

// ─── Route Names ────────────────────────────────────────────────────────────
class GoRoutes {
  static const home = '/go-router-demo';
  static const slide = 'slide';
  static const fade = 'fade';
  static const scale = 'scale';
  static const slideUp = 'slide-up';
  static const combined = 'combined';
  static const noAnim = 'no-anim';
  static const sharedAxis = 'shared-axis';
  static const list = 'list';
  static const detail = 'detail';
}

// ─── GoRouter Configuration ──────────────────────────────────────────────────
final goRouterInstance = GoRouter(
  initialLocation: GoRoutes.home,
  routes: [
    GoRoute(
      path: GoRoutes.home,
      name: 'go-router-home',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: GoRouterDemoScreen(),
      ),
      routes: [
        // 1. Slide from Right (default-style)
        GoRoute(
          path: GoRoutes.slide,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const GoRouterDetailPage(
              title: 'Slide Transition',
              color: Colors.blue,
              description: 'GoRouter ka default slide — right se left mein aata hai, '
                  'CupertinoPage jaise feel.',
              code: '''GoRoute(
  path: '/slide',
  pageBuilder: (context, state) =>
    CustomTransitionPage(
      child: const MyPage(),
      transitionsBuilder:
        (ctx, anim, secAnim, child) =>
          SlideTransition(
            position: Tween(
              begin: Offset(1, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: anim,
              curve: Curves.easeInOut,
            )),
            child: child,
          ),
    ),
),''',
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                )),
                child: child,
              );
            },
          ),
        ),

        // 2. Fade
        GoRoute(
          path: GoRoutes.fade,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const GoRouterDetailPage(
              title: 'Fade Transition',
              color: Colors.purple,
              description: 'Smooth opacity se page appear hota hai. '
                  'Minimal aur elegant feel ke liye best.',
              code: '''transitionsBuilder:
  (ctx, anim, secAnim, child) =>
    FadeTransition(
      opacity: anim,
      child: child,
    ),
transitionDuration:
  const Duration(milliseconds: 400),''',
            ),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        ),

        // 3. Scale (zoom in)
        GoRoute(
          path: GoRoutes.scale,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const GoRouterDetailPage(
              title: 'Scale Transition',
              color: Colors.teal,
              description: 'Page center se zoom in hota hai. '
                  'Curves.easeOutBack se satisfying bounce effect aata hai.',
              code: '''transitionsBuilder:
  (ctx, anim, secAnim, child) =>
    ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: anim,
        curve: Curves.easeOutBack,
      )),
      child: child,
    ),''',
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutBack,
                  ),
                ),
                child: child,
              );
            },
          ),
        ),

        // 4. Slide from Bottom
        GoRoute(
          path: GoRoutes.slideUp,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const GoRouterDetailPage(
              title: 'Slide Up Transition',
              color: Colors.green,
              description: 'Page neeche se upar slide karta hai. '
                  'Modal dialogs aur bottom sheets ke liye best.',
              code: '''transitionsBuilder:
  (ctx, anim, secAnim, child) =>
    SlideTransition(
      position: Tween(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: anim,
        curve: Curves.easeInOut,
      )),
      child: child,
    ),''',
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                )),
                child: child,
              );
            },
          ),
        ),

        // 5. Combined: Fade + Scale + Slide
        GoRoute(
          path: GoRoutes.combined,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 600),
            child: const GoRouterDetailPage(
              title: 'Combined Transition',
              color: Colors.pink,
              description: 'Ek saath Fade + Scale + Slide combine karke '
                  'spectacular entrance effect banta hai.',
              code: '''transitionsBuilder:
  (ctx, anim, secAnim, child) {
    final slide = Tween(
      begin: const Offset(0.3, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: anim,
      curve: Curves.easeOut,
    ));
    final fade = CurvedAnimation(
      parent: anim,
      curve: Curves.easeIn,
    );
    final scale = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: anim,
      curve: Curves.easeOut,
    ));
    return FadeTransition(
      opacity: fade,
      child: ScaleTransition(
        scale: scale,
        child: SlideTransition(
          position: slide,
          child: child,
        ),
      ),
    );
  },''',
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final slide = Tween(
                begin: const Offset(0.3, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ));
              final fade = CurvedAnimation(
                parent: animation,
                curve: Curves.easeIn,
              );
              final scale = Tween<double>(begin: 0.85, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut),
              );
              return FadeTransition(
                opacity: fade,
                child: ScaleTransition(
                  scale: scale,
                  child: SlideTransition(position: slide, child: child),
                ),
              );
            },
          ),
        ),

        // 6. No Animation (instant)
        GoRoute(
          path: GoRoutes.noAnim,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const GoRouterDetailPage(
              title: 'No Transition',
              color: Colors.blueGrey,
              description: 'NoTransitionPage — bilkul instant switch. '
                  'Tab bars aur bottom nav ke liye ideal.',
              code: '''GoRoute(
  path: '/no-anim',
  pageBuilder: (context, state) =>
    NoTransitionPage(    // ← bas itna!
      key: state.pageKey,
      child: const MyPage(),
    ),
),''',
            ),
          ),
        ),

        // 7. Shared-Axis style (manual)
        GoRoute(
          path: GoRoutes.sharedAxis,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 500),
            child: const GoRouterDetailPage(
              title: 'Shared Axis Style',
              color: Colors.indigo,
              description: 'Material Shared Axis feel — secondary page '
                  'fade-out hoti hai aur new page horizontal axis pe aati hai.',
              code: '''transitionsBuilder:
  (ctx, anim, secAnim, child) {
    // outgoing page
    final fade = Tween<double>(
      begin: 0.0, end: 1.0,
    ).animate(CurvedAnimation(
      parent: anim,
      curve: const Interval(0.3, 1.0),
    ));
    final slide = Tween(
      begin: const Offset(0.05, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: anim,
      curve: Curves.easeOutCubic,
    ));
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(
        position: slide,
        child: child,
      ),
    );
  },''',
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: const Interval(0.3, 1.0),
                ),
              );
              final slide = Tween(
                begin: const Offset(0.05, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              ));
              return FadeTransition(
                opacity: fade,
                child: SlideTransition(position: slide, child: child),
              );
            },
          ),
        ),

        // 8. List → Detail (nested demo)
        GoRoute(
          path: GoRoutes.list,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const _GoRouterListScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                FadeTransition(opacity: animation, child: child),
          ),
          routes: [
            GoRoute(
              path: '${GoRoutes.detail}/:id',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id'] ?? '0';
                final extra = state.extra as Map<String, dynamic>? ?? {};
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: _GoRouterNestedDetailPage(
                    id: int.tryParse(id) ?? 0,
                    color: extra['color'] as Color? ?? Colors.blue,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      )),
                      child: child,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

// ─── Main Demo Screen ────────────────────────────────────────────────────────
class GoRouterDemoScreen extends StatelessWidget {
  const GoRouterDemoScreen({super.key});

  static const _demos = [
    _DemoItem('↗️ Slide Transition', 'Right se Left slide', Colors.blue, Icons.arrow_forward, GoRoutes.slide),
    _DemoItem('🌫️ Fade Transition', 'Smooth opacity change', Colors.purple, Icons.blur_on, GoRoutes.fade),
    _DemoItem('🔍 Scale Transition', 'Center se zoom in', Colors.teal, Icons.zoom_in, GoRoutes.scale),
    _DemoItem('⬆️ Slide Up', 'Bottom se upar', Colors.green, Icons.arrow_upward, GoRoutes.slideUp),
    _DemoItem('💫 Combined', 'Fade + Scale + Slide', Colors.pink, Icons.auto_awesome, GoRoutes.combined),
    _DemoItem('⚡ No Transition', 'Instant page switch', Colors.blueGrey, Icons.flash_on, GoRoutes.noAnim),
    _DemoItem('🎭 Shared Axis Style', 'Material-style fade+slide', Colors.indigo, Icons.swap_horiz, GoRoutes.sharedAxis),
    _DemoItem('📋 Nested Routes', 'List → Detail pattern', Colors.orange, Icons.account_tree, GoRoutes.list),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('🔀 go_router Animations'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade50, Colors.indigo.shade50],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 12),
            // Info banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1565C0),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📦 go_router v14.8.1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'CustomTransitionPage aur NoTransitionPage use karke '
                    'GoRouter mein koi bhi animation daal sakte ho!',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ..._demos.map((demo) => _DemoCard(demo: demo)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ─── Demo Item model ─────────────────────────────────────────────────────────
class _DemoItem {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  final String route;
  const _DemoItem(this.title, this.subtitle, this.color, this.icon, this.route);
}

// ─── Demo Card ───────────────────────────────────────────────────────────────
class _DemoCard extends StatelessWidget {
  final _DemoItem demo;
  const _DemoCard({required this.demo});

  @override
  Widget build(BuildContext context) {
    final color = demo.color;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.go('${GoRoutes.home}/${demo.route}'),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [color.shade50, color.shade100],
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
                child: Icon(demo.icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      demo.title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: color.shade900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      demo.subtitle,
                      style: TextStyle(fontSize: 14, color: color.shade700),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: color.shade400),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Detail Page (shows animation info + code) ───────────────────────────────
class GoRouterDetailPage extends StatelessWidget {
  final String title;
  final Color color;
  final String description;
  final String code;

  const GoRouterDetailPage({
    super.key,
    required this.title,
    required this.color,
    required this.description,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
        foregroundColor: Colors.white,
        leading: BackButton(
          onPressed: () => context.go(GoRoutes.home),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color.shade200, color.shade50],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              // Animation info card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: color.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.info_outline, color: color, size: 24),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: color.shade900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Code snippet card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E2E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.8),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.code, color: Colors.white, size: 18),
                          const SizedBox(width: 8),
                          const Text(
                            'go_router code',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.copy,
                                color: Colors.white, size: 18),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Code copied! 📋'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        code,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12.5,
                          color: Color(0xFFCDD6F4),
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Go back button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => context.go(GoRoutes.home),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back to go_router Demo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.home),
                  label: const Text('Main App Home'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: color,
                    side: BorderSide(color: color, width: 2),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Nested Routes: List Screen ──────────────────────────────────────────────
class _GoRouterListScreen extends StatelessWidget {
  const _GoRouterListScreen();

  static const _colors = [
    Colors.red, Colors.green, Colors.blue,
    Colors.orange, Colors.purple, Colors.teal,
    Colors.pink, Colors.indigo, Colors.cyan, Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📋 Nested Routes List'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        leading: BackButton(onPressed: () => context.go(GoRoutes.home)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange.shade50, Colors.amber.shade50],
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '👆 Kisi bhi item pe tap karo\nDeep linking: /go-router-demo/list/detail/:id',
                style: TextStyle(color: Colors.white, fontSize: 13, height: 1.4),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  final color = _colors[index % _colors.length];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () => context.go(
                        '${GoRoutes.home}/${GoRoutes.list}/${GoRoutes.detail}/${index + 1}',
                        extra: {'color': color},
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          gradient: LinearGradient(
                            colors: [color.shade50, color.shade100],
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: color,
                              radius: 24,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Item #${index + 1}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: color.shade900,
                                    ),
                                  ),
                                  Text(
                                    'detail/${index + 1} — nested route',
                                    style: TextStyle(
                                        fontSize: 13, color: color.shade600),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.chevron_right, color: color.shade400),
                          ],
                        ),
                      ),
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

// ─── Nested Routes: Detail Screen ────────────────────────────────────────────
class _GoRouterNestedDetailPage extends StatelessWidget {
  final int id;
  final Color color;
  const _GoRouterNestedDetailPage({required this.id, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail #$id'),
        backgroundColor: color,
        foregroundColor: Colors.white,
        leading: BackButton(
          onPressed: () => context.go('${GoRoutes.home}/${GoRoutes.list}'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color.shade300, color.shade100],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color.shade700,
                  radius: 60,
                  child: Text(
                    '#$id',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Item #$id Detail Page',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: color.shade900,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    'URL: /go-router-demo/list/detail/$id\n\n'
                    'Yeh nested route hai. GoRouter automatically path '
                    'parameters parse karta hai (:id) aur extra data bhi '
                    'pass kar sakte hain.',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade800,
                        height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () =>
                      context.go('${GoRoutes.home}/${GoRoutes.list}'),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('List pe wapas jao'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
