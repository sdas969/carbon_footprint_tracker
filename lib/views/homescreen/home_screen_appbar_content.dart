import 'package:carbon_footprint_tracker/widgets/fade_on_scroll.dart';
import 'package:flutter/material.dart';

class HomeScreenAppBarContent extends StatelessWidget {
  const HomeScreenAppBarContent({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) => FlexibleSpaceBar(
      background: FadeOnScroll(
          scrollController: _scrollController,
          child: const SafeArea(
              child: Column(children: [
            SizedBox(height: kToolbarHeight),
            Expanded(
                child: FittedBox(child: CircularProgressIndicator(value: 0.5))),
            Row(children: [
              Expanded(
                  flex: 1,
                  child: ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      leading: Icon(Icons.ac_unit),
                      subtitle: Text("Tap to edit"),
                      title: Text("506kg" + " Monthly Limit"))),
              Expanded(
                child: ListTile(
                    trailing: Icon(Icons.keyboard_arrow_right),
                    leading: Icon(Icons.ac_unit),
                    subtitle: Text("Tap to edit"),
                    title: Text("506kg" + " Monthly Limit")),
              )
            ])
          ]))));
}
