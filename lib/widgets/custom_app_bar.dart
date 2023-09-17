import 'package:carbon_footprint_tracker/constants/universal.dart';
import 'package:carbon_footprint_tracker/widgets/fade_on_scroll.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.scrollController,
      this.actions = const [],
      required this.imgUrl,
      this.collapsedHeight,
      this.flexibleSpace,
      this.bottom,
      this.icon,
      this.widgets = const [],
      this.pinned = false,
      this.elevation = 10,
      this.title,
      this.expandedHeight = 400,
      this.titleTextStyle = const TextStyle(
          fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
      this.shape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      this.titleString = ''});
  final bool pinned;
  final List<Widget> actions;
  final String imgUrl;
  final String titleString;
  final ShapeBorder shape;
  final double elevation, expandedHeight;
  final TextStyle titleTextStyle;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? collapsedHeight;
  final Widget? icon;
  final ScrollController scrollController;
  final List<Widget> widgets;
  final Widget? title;

  @override
  Widget build(BuildContext context) => SliverAppBar(
      elevation: elevation,
      collapsedHeight: collapsedHeight,
      shape: shape,
      pinned: pinned,
      backgroundColor: const Color(0xff163946),
      bottom: bottom,
      actions: actions,
      expandedHeight: expandedHeight,
      title: title,
      flexibleSpace: flexibleSpace ??
          FlexibleSpaceBar(
              background: FadeOnScroll(
                  zeroOpacityOffset: 150,
                  scrollController: scrollController,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(100),
                                    child: icon)),
                          ] +
                          widgets)),
              centerTitle: true,
              stretchModes: stretchModes),
      stretch: true);
}
