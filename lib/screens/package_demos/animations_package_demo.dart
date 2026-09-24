import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import '../../utils/color_extensions.dart';

class AnimationsPackageDemoScreen extends StatefulWidget {
  const AnimationsPackageDemoScreen({super.key});

  @override
  State<AnimationsPackageDemoScreen> createState() =>
      _AnimationsPackageDemoScreenState();
}

class _AnimationsPackageDemoScreenState
    extends State<AnimationsPackageDemoScreen> {
  int _selectedIndex = 0;
  bool _isGridView = true;

  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('✨ animations Package'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.purple.shade50],
          ),
        ),
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: _isGridView
              ? _buildGridView()
              : _buildListView(),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      key: const ValueKey('grid'),
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return OpenContainer(
          closedElevation: 4,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          closedColor: _colors[index % _colors.length].shade100,
          openColor: _colors[index % _colors.length],
          transitionDuration: const Duration(milliseconds: 500),
          closedBuilder: (context, action) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _colors[index % _colors.length].shade100,
                    _colors[index % _colors.length].shade200,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 60,
                    color: _colors[index % _colors.length].shade700,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Item ${index + 1}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _colors[index % _colors.length].shade900,
                    ),
                  ),
                ],
              ),
            );
          },
          openBuilder: (context, action) {
            return _DetailScreen(
              index: index,
              color: _colors[index % _colors.length],
            );
          },
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      key: const ValueKey('list'),
      padding: const EdgeInsets.all(16),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: OpenContainer(
            closedElevation: 2,
            closedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            closedColor: _colors[index % _colors.length].shade50,
            openColor: _colors[index % _colors.length],
            transitionDuration: const Duration(milliseconds: 500),
            closedBuilder: (context, action) {
              return Container(
                height: 80,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      _colors[index % _colors.length].shade50,
                      _colors[index % _colors.length].shade100,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 40,
                      color: _colors[index % _colors.length].shade700,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Item ${index + 1}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: _colors[index % _colors.length].shade900,
                            ),
                          ),
                          Text(
                            'Tap to open with OpenContainer',
                            style: TextStyle(
                              fontSize: 14,
                              color: _colors[index % _colors.length].shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: _colors[index % _colors.length].shade400,
                    ),
                  ],
                ),
              );
            },
            openBuilder: (context, action) {
              return _DetailScreen(
                index: index,
                color: _colors[index % _colors.length],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return OpenContainer(
      closedElevation: 8,
      closedShape: const RoundedRectangleBorder(),
      closedColor: Colors.white,
      openColor: Colors.purple,
      closedBuilder: (context, action) {
        return SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home, 'Home'),
              _buildNavItem(1, Icons.explore, 'Explore'),
              _buildNavItem(2, Icons.favorite, 'Favorites'),
              _buildNavItem(3, Icons.person, 'Profile'),
            ],
          ),
        );
      },
      openBuilder: (context, action) {
        return _NavDetailScreen(index: _selectedIndex);
      },
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailScreen extends StatelessWidget {
  final int index;
  final Color color;

  const _DetailScreen({required this.index, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item ${index + 1}'),
        backgroundColor: color,
        foregroundColor: Colors.white,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 120, color: color.shade700),
              const SizedBox(height: 20),
              Text(
                'Item ${index + 1}',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: color.shade900,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'This is an OpenContainer transition from the animations package. It smoothly morphs between the closed and open states!',
                  style: TextStyle(
                    fontSize: 16,
                    color: color.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavDetailScreen extends StatelessWidget {
  final int index;

  const _NavDetailScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    final titles = ['Home', 'Explore', 'Favorites', 'Profile'];
    final icons = [Icons.home, Icons.explore, Icons.favorite, Icons.person];
    final colors = [Colors.blue, Colors.green, Colors.red, Colors.purple];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[index]),
        backgroundColor: colors[index],
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colors[index].shade300, colors[index].shade100],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icons[index], size: 120, color: colors[index].shade700),
              const SizedBox(height: 20),
              Text(
                titles[index],
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: colors[index].shade900,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'This demonstrates the OpenContainer transition for navigation items!',
                  style: TextStyle(
                    fontSize: 16,
                    color: colors[index].shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
