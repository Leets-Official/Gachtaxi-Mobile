import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class NotificationOverlayBanner extends StatefulWidget {
  final String title;
  final String message;
  final VoidCallback onClose;

  const NotificationOverlayBanner({
    super.key,
    required this.title,
    required this.message,
    required this.onClose,
  });

  @override
  State<NotificationOverlayBanner> createState() => _NotificationOverlayBannerState();
}

class _NotificationOverlayBannerState extends State<NotificationOverlayBanner>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  double _dragOffsetY = 0.0;
  bool _isClosing = false;
  Timer? _autoCloseTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _controller.forward();

    _startAutoCloseTimer(const Duration(seconds: 3));
  }

  void _startAutoCloseTimer(Duration duration) {
    _autoCloseTimer?.cancel();
    _autoCloseTimer = Timer(duration, _closeWithAnimation);
  }

  void _closeWithAnimation() {
    if (_isClosing) return;
    _isClosing = true;
    _autoCloseTimer?.cancel();

    _controller.reverse().then((_) {
      if (mounted) widget.onClose();
    });
  }

  void _cancelDrag() {
    final AnimationController tempController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    final Animation<double> dropAnimation = Tween<double>(
      begin: _dragOffsetY,
      end: 0.0,
    ).animate(CurvedAnimation(parent: tempController, curve: Curves.easeOut));

    tempController.addListener(() {
      setState(() {
        _dragOffsetY = dropAnimation.value;
      });
    });

    tempController.forward().then((_) {
      tempController.dispose();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _autoCloseTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final slideOffsetY = (1 - _controller.value) * -100;
        return Transform.translate(
          offset: Offset(0, slideOffsetY + _dragOffsetY),
          child: GestureDetector(
            onVerticalDragStart: (_) {
              _autoCloseTimer?.cancel();
            },
            onVerticalDragUpdate: (details) {
              setState(() {
                _dragOffsetY += details.delta.dy;
                _dragOffsetY = _dragOffsetY.clamp(-100.0, 0.0);
              });
            },
            onVerticalDragEnd: (_) {
              if (_dragOffsetY < -20) {
                widget.onClose();
              } else {
                _cancelDrag();
                _startAutoCloseTimer(const Duration(seconds: 1));
              }
            },
            child: _buildBannerContent(),
          ),
        );
      },
    );
  }

  Widget _buildBannerContent() {
    final double topSafePadding = MediaQuery.of(context).padding.top;
    final double totalHeight = topSafePadding + 64.h;

    return Container(
      width: double.infinity.w,
      height: totalHeight,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: topSafePadding, bottom: 4.h),
      decoration: BoxDecoration(
        color: AppColors.neutralDark,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 내용
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/taxi_on_icon.svg"),
              SizedBox(width: 20.w),
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 240.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: AppTypography.fontSizeSmall.sp,
                          color: AppColors.white,
                          fontWeight: AppTypography.fontWeightSemibold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        widget.message,
                        style: TextStyle(
                          fontSize: AppTypography.fontSizeExtraSmall,
                          color: AppColors.white,
                          fontWeight: AppTypography.fontWeightMedium,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          // 드래그 바
          Container(
            width: 36.w,
            height: 3.h,
            margin: EdgeInsets.only(bottom: 4.h),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
        ],
      ),
    );
  }
}
