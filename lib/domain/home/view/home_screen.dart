import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/home/components/custom_bottom_nav_bar.dart';
import 'package:gachtaxi_app/domain/home/components/custom_bottom_sheet.dart';
import 'package:gachtaxi_app/domain/home/components/custom_top_bar.dart';
import 'package:gachtaxi_app/domain/home/components/google_maps.dart';
import 'package:gachtaxi_app/domain/home/providers/sheet_height_provider.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/tab_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController? _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _selectedIndex = _tabController!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomSheetState = ref.watch(sheetHeightNotifierProvider);

    return DefaultLayout(
      bottomNavigationBar: CustomBottomNavBar(
          tabController: _tabController, selectedIndex: _selectedIndex),
      child: SafeArea(
        child: Stack(
          children: [
            GoogleMaps(),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              top:
                  bottomSheetState.containerHeight == bottomSheetState.minHeight
                      ? 20
                      : -80,
              left: 20,
              right: 20,
              child: CustomTopBar(),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomSheet(
                child: TabView(tabController: _tabController!),
              ),
            )
          ],
        ),
      ),
    );
  }
}
