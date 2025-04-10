import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/home/components/custom_bottom_sheet.dart';
import 'package:gachtaxi_app/domain/home/components/custom_top_bar.dart';
import 'package:gachtaxi_app/domain/home/components/google_maps.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/tab_view.dart';

class HomeScreen extends ConsumerWidget {
  final TabController tabController;

  const HomeScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomSheetState = ref.watch(sheetHeightNotifierProvider);

    return SafeArea(
      child: Stack(
        children: [
          GoogleMaps(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: bottomSheetState.containerHeight <=
                    bottomSheetState.basicHeight * 1.2
                ? 20
                : -80,
            left: 20,
            right: 20,
            child: const CustomTopBar(),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomSheet(
              child: TabView(tabController: tabController),
            ),
          )
        ],
      ),
    );
  }
}
