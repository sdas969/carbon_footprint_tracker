import 'package:carbon_footprint_tracker/views/homescreen/app_bar_title_widget.dart';
import 'package:carbon_footprint_tracker/views/homescreen/app_content.dart';
import 'package:carbon_footprint_tracker/views/homescreen/home_screen_appbar_content.dart';
import 'package:carbon_footprint_tracker/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: CustomScrollView(controller: _scrollController, slivers: [
        CustomAppBar(
            scrollController: _scrollController,
            imgUrl: "",
            title: AppBarTitleWidget(scrollController: _scrollController),
            flexibleSpace:
                HomeScreenAppBarContent(scrollController: _scrollController)),
        const AppContent()
      ]));
}
