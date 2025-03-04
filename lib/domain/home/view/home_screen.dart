import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/home/components/custom_bottom_nav_bar.dart';
import 'package:gachtaxi_app/domain/home/components/custom_bottom_sheet.dart';
import 'package:gachtaxi_app/domain/home/components/custom_top_bar.dart';
import 'package:gachtaxi_app/domain/home/components/google_maps.dart';
import 'package:gachtaxi_app/domain/home/view/tab-view/tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
    return DefaultLayout(
      bottomNavigationBar: CustomBottomNavBar(
          tabController: _tabController, selectedIndex: _selectedIndex),
      child: SafeArea(
        child: Stack(
          children: [
            GoogleMaps(),
            CustomTopBar(),
            CustomBottomSheet(
              child: TabView(tabController: _tabController!),
            ),
          ],
        ),
      ),
    );
  }
}
