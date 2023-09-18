import 'package:carbon_footprint_tracker/providers/emission_provider.dart';
import 'package:carbon_footprint_tracker/providers/user_provider.dart';
import 'package:carbon_footprint_tracker/views/homescreen/components/app_bar_title_widget.dart';
import 'package:carbon_footprint_tracker/views/homescreen/components/app_content.dart';
import 'package:carbon_footprint_tracker/views/homescreen/components/home_screen_appbar_content.dart';
import 'package:carbon_footprint_tracker/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  late EmissionProvider _emissionProvider;
  late UserProvider _userProvider;

  @override
  void initState() {
    _emissionProvider = Provider.of<EmissionProvider>(context, listen: false);
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    if (_userProvider.userData == null) {
      _userProvider.initData();
    }
    if (_emissionProvider.perCategoryStats == null) {
      _emissionProvider.initData(null);
    }
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
