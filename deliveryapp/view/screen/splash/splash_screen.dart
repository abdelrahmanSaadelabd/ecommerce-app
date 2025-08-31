import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;
  late Animation<double> _bgAnimation;
  bool showOnboarding = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _logoAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _bgAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        showOnboarding = true;
      });
      Future.delayed(const Duration(milliseconds: 5), () {
        Get.offAllNamed('/loginpage');
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedBackground(double width, double height) {
    return AnimatedBuilder(
      animation: _bgAnimation,
      builder: (context, child) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.lerp(
                  const Color.fromARGB(255, 252, 201, 36),
                  const Color(0xFFF7E7A6),
                  _bgAnimation.value,
                )!,
                Color.lerp(
                  const Color(0xFFF7E7A6),
                  Colors.white,
                  _bgAnimation.value,
                )!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedShapes(double width, double height) {
    return Stack(
      children: [
        Positioned(
          top: 60,
          left: 30,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: (0.5 + 0.5 * _bgAnimation.value).clamp(0.0, 1.0),
                child: Container(
                  width: 120 + 60 * _bgAnimation.value,
                  height: 120 + 60 * _bgAnimation.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amberAccent.withOpacity(
                      0.2 + 0.3 * _bgAnimation.value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 80,
          right: 40,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: (0.3 + 0.3 * _bgAnimation.value).clamp(0.0, 1.0),
                child: Container(
                  width: 80 + 40 * _bgAnimation.value,
                  height: 80 + 40 * _bgAnimation.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange.withOpacity(
                      0.2 + 0.3 * _bgAnimation.value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBarColor = const Color(0xFFBFA23F);
    final accentColor = const Color(0xFFF7E7A6);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: accentColor,
      body: Stack(
        children: [
          _buildAnimatedBackground(width, height),
          _buildAnimatedShapes(width, height),
          AnimatedSlide(
            offset: showOnboarding ? const Offset(0, -1) : Offset.zero,
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeInOutCubic,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    opacity: _logoAnimation,
                    child: ScaleTransition(
                      scale: _logoAnimation,
                      child: RotationTransition(
                        turns: Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(_controller),
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: appBarColor.withOpacity(0.2),
                                blurRadius: 30,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            "assets/image/delivery.png",
                            color: appBarColor,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeTransition(
                    opacity: _textAnimation,
                    child: Column(
                      children: [
                        Text(
                          "Smart Delivery Store",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: appBarColor,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          "From your phone to your door,\n order now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 18),
                        AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          curve: Curves.easeInOut,
                          width: 120,
                          height: 5,
                          decoration: BoxDecoration(
                            color: appBarColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: Offset(0, 20 * (1 - _logoAnimation.value)),
                            child: Opacity(
                              opacity: _logoAnimation.value.clamp(0.0, 1.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.delivery_dining,
                                    color: appBarColor,
                                    size: 36,
                                  ),
                                  Text(
                                    "delivery",
                                    style: TextStyle(
                                      color: appBarColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Transform.translate(
                            offset: Offset(0, 20 * (1 - _logoAnimation.value)),
                            child: Opacity(
                              opacity: _logoAnimation.value.clamp(0.0, 1.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.shopping_bag,
                                    color: appBarColor,
                                    size: 36,
                                  ),
                                  Text(
                                    "shopping",
                                    style: TextStyle(
                                      color: appBarColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Transform.translate(
                            offset: Offset(0, 20 * (1 - _logoAnimation.value)),
                            child: Opacity(
                              opacity: _logoAnimation.value.clamp(0.0, 1.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: appBarColor,
                                    size: 36,
                                  ),
                                  Text(
                                    "Your Address",
                                    style: TextStyle(
                                      color: appBarColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
