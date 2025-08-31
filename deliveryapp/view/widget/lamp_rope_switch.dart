import 'package:flutter/material.dart';

class LampRopeSwitch extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;
  const LampRopeSwitch({
    Key? key,
    required this.isDarkMode,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<LampRopeSwitch> createState() => _LampRopeSwitchState();
}

class _LampRopeSwitchState extends State<LampRopeSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _ropePullAnim;
  late Animation<double> _bulbGlowAnim;
  bool _isPulled = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _ropePullAnim = Tween<double>(
      begin: 0,
      end: 60,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _bulbGlowAnim = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    if (widget.isDarkMode) {
      _controller.value = 1.0;
      _isPulled = true;
    }
  }

  @override
  void didUpdateWidget(covariant LampRopeSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isDarkMode != oldWidget.isDarkMode) {
      if (widget.isDarkMode) {
        _controller.forward();
        _isPulled = true;
      } else {
        _controller.reverse();
        _isPulled = false;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handlePull() {
    if (_isPulled) {
      _controller.reverse();
      widget.onChanged(false);
    } else {
      _controller.forward();
      widget.onChanged(true);
    }
    setState(() {
      _isPulled = !_isPulled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (_) => _handlePull(),
      child: SizedBox(
        width: 60,
        height: 120,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                // Rope
                Positioned(
                  top: 0,
                  child: Container(
                    width: 6,
                    height: 60 + _ropePullAnim.value,
                    decoration: BoxDecoration(
                      color: Colors.brown[400],
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                // Rope handle
                Positioned(
                  top: 60 + _ropePullAnim.value - 10,
                  child: Container(
                    width: 24,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 201, 86, 51),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                // Bulb
                Positioned(
                  top: 70 + _ropePullAnim.value,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          widget.isDarkMode
                              ? const Color.fromARGB(
                                255,
                                15,
                                14,
                                4,
                              ).withOpacity(_bulbGlowAnim.value)
                              : Colors.grey[300],
                      boxShadow:
                          widget.isDarkMode
                              ? [
                                BoxShadow(
                                  color: const Color.fromARGB(
                                    255,
                                    87,
                                    77,
                                    77,
                                  ).withOpacity(_bulbGlowAnim.value * 0.7),
                                  blurRadius: 32,
                                  spreadRadius: 8,
                                ),
                              ]
                              : [],
                    ),
                    child: Icon(
                      Icons.lightbulb,
                      color:
                          widget.isDarkMode ? Colors.amber : Colors.grey[500],
                      size: 32,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
