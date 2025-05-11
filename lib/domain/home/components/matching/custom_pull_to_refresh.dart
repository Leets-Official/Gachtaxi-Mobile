import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPullToRefresh extends StatefulWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const CustomPullToRefresh({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  State<CustomPullToRefresh> createState() => _CustomPullToRefreshState();
}

class _CustomPullToRefreshState extends State<CustomPullToRefresh>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _refreshDropAnimation;

  double? _dragStartY; // 드래그 시작 위치 저장

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _refreshDropAnimation = Tween<double>(begin: -40, end: 50).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  Future<void> _startDropAnimation() async {
    if (_controller.isAnimating) return;
    await _controller.forward();
    widget.onRefresh();
    await Future.delayed(const Duration(milliseconds: 300));
    await _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        _dragStartY = event.position.dy;
      },
      onPointerMove: (event) {
        if (_dragStartY != null) {
          final dragDistance = event.position.dy - _dragStartY!;
          if (dragDistance > 20) {
            _dragStartY = null; // 한 번만 실행
            _startDropAnimation();
          }
        }
      },
      onPointerUp: (_) {
        _dragStartY = null;
      },
      child: Stack(
        children: [
          widget.child,
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double value = _refreshDropAnimation.value;
              if (value < 0) return const SizedBox.shrink();
              return Positioned(
                top: value <= 10 ? value : 10,
                left: 0,
                right: 0,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/refresh_icon.svg',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
