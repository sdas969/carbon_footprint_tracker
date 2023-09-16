import 'package:carbon_footprint_tracker/views/homescreen/add_data_button.dart';
import 'package:carbon_footprint_tracker/views/homescreen/custom_list_tile.dart';
import 'package:carbon_footprint_tracker/views/homescreen/date_picker_widget.dart';
import 'package:flutter/material.dart';

class AppContent extends StatefulWidget {
  const AppContent({super.key});

  @override
  State<AppContent> createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(<Widget>[
              const DatePickerWidget(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Expanded(child: Text("Today")),
                    AddDataButton(),
                  ],
                ),
              )
            ] +
            List<Widget>.generate(10, (index) => const CustomListTile())));
  }
}
