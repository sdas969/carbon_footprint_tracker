import 'package:carbon_footprint_tracker/views/homescreen/components/highlights_widget.dart';
import 'package:carbon_footprint_tracker/views/homescreen/components/progress_widget.dart';
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
            ProgressWidget(),
            HighlightsWidget()
          ]))));
}
