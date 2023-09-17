import 'package:carbon_footprint_tracker/providers/user_provider.dart';
import 'package:carbon_footprint_tracker/widgets/fade_on_scroll.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) => FadeOnScroll(
      zeroOpacityOffset: 150,
      scrollController: _scrollController,
      child: Consumer<UserProvider>(
          builder: (context, userProvider, _) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Hi, ${userProvider.userData == null ? "..." : userProvider.userData?.name}",
                  style: const TextStyle(fontSize: 30, color: Colors.white)))));
}
