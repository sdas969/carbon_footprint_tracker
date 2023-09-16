import 'package:carbon_footprint_tracker/constants/universal.dart';
import 'package:carbon_footprint_tracker/views/homescreen/app_content.dart';
import 'package:carbon_footprint_tracker/widgets/custom_app_bar.dart';
import 'package:carbon_footprint_tracker/widgets/fade_on_scroll.dart';
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
            actions: const [],
            imgUrl: "",
            flexibleSpace: FlexibleSpaceBar(
              background: FadeOnScroll(
                  scrollController: _scrollController,
                  child: const SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: kToolbarHeight,
                        ),
                        Expanded(
                            child: FittedBox(
                          child: CircularProgressIndicator(
                            value: 0.5,
                          ),
                        )),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                trailing: Icon(Icons.keyboard_arrow_right),
                                leading: Icon(Icons.ac_unit),
                                subtitle: Text("Tap to edit"),
                                title: Text("506kg" + " Monthly Limit"),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                trailing: Icon(Icons.keyboard_arrow_right),
                                leading: Icon(Icons.ac_unit),
                                subtitle: Text("Tap to edit"),
                                title: Text("506kg" + " Monthly Limit"),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            titleString: appTitle),
        const AppContent()
      ]));
}
