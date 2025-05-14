import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPullToRefresh extends StatefulWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final ScrollController scrollController;

  const CustomPullToRefresh({
    super.key,
    required this.child,
    required this.onRefresh,
    required this.scrollController,
  });

  @override
  State<CustomPullToRefresh> createState() => _CustomPullToRefreshState();
}

class _CustomPullToRefreshState extends State<CustomPullToRefresh>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _refreshDropAnimation;

  double? _dragStartY; // 드래그 시작 위치 저장
  bool _refreshing = false; // 새로고침 중 플래그
  bool _pullHandled = false;

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
    setState(() {
      _refreshing = true;
    });
    await _controller.forward();
    await widget.onRefresh();
    await Future.delayed(const Duration(milliseconds: 300));
    await _controller.reverse();
    setState(() {
      _refreshing = false;
    });
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
        if (widget.scrollController.hasClients &&
            widget.scrollController.offset <= 0 &&
            !_refreshing) {
          _dragStartY = event.position.dy;
          _pullHandled = false; // 새 드래그 시작
        } else {
          _dragStartY = null;
        }
      },
      onPointerMove: (event) {
        if (_dragStartY != null && !_refreshing && !_pullHandled) {
          final dragDistance = event.position.dy - _dragStartY!;
          if (widget.scrollController.hasClients &&
              widget.scrollController.offset <= 0 &&
              dragDistance > 20) {
            _pullHandled = true; // 한 번만 실행
            _dragStartY = null;
            _startDropAnimation();
          }
        }
      },
      onPointerUp: (_) {
        _dragStartY = null;
        _pullHandled = false; // 손가락을 뗄 때 다시 허용
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
