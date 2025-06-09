import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AnimatedLogoPage()));

class AnimatedLogoPage extends StatefulWidget {
  const AnimatedLogoPage({super.key});
  @override
  AnimatedLogoPageState createState() => AnimatedLogoPageState();
}

class AnimatedLogoPageState extends State<AnimatedLogoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 100,
      end: 800,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Logo')),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return FlutterLogo(size: _animation.value);
          },
        ),
      ),
    );
  }
}
