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
  double _dragOffset = 0;
  bool _isRefreshing = false;
  bool _hasTriggeredRefresh = false;

  static const double triggerOffset = 100;

  late final AnimationController _controller;
  late final Animation<double> _refreshDropAnimation;

  bool get _shouldShowIcon => _dragOffset > 0 || _isRefreshing;

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

  bool _canTriggerRefresh(ScrollMetrics metrics) {
    return metrics.pixels <= metrics.minScrollExtent;
  }

  void _startRefresh() {
    _isRefreshing = true;
    _hasTriggeredRefresh = true;

    _controller.forward(); // 아이콘 내려오는 애니메이션

    widget.onRefresh().then((_) {
      if (!mounted) return;

      _controller.reverse(); // 아이콘 다시 올라감

      setState(() {
        _dragOffset = 0;
        _isRefreshing = false;
        _hasTriggeredRefresh = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is OverscrollNotification &&
            notification.metrics.axis == Axis.vertical &&
            _canTriggerRefresh(notification.metrics)) {
          setState(() {
            if (!_isRefreshing) {
              _dragOffset = (_dragOffset + notification.overscroll)
                  .clamp(0, triggerOffset);

              if (_dragOffset >= triggerOffset && !_hasTriggeredRefresh) {
                _startRefresh(); // 한 번만 호출됨
              }
            }
          });
        }

        if (notification is ScrollEndNotification && !_isRefreshing) {
          setState(() {
            _dragOffset = 0;
          });
        }

        return false;
      },
      child: Stack(
        children: [
          widget.child,
          if (_shouldShowIcon)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final offsetY = _isRefreshing
                    ? _refreshDropAnimation.value
                    : (_dragOffset / 2).clamp(0, triggerOffset / 2) + 10;

                return Positioned(
                  top: offsetY.toDouble(),
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
