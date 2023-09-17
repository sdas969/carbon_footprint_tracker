import 'package:carbon_footprint_tracker/providers/emission_provider.dart';
import 'package:carbon_footprint_tracker/views/homescreen/custom_list_tile.dart';
import 'package:carbon_footprint_tracker/views/homescreen/date_picker_widget.dart';
import 'package:carbon_footprint_tracker/views/homescreen/day_button_widget.dart';
import 'package:carbon_footprint_tracker/widgets/loading_widget.dart';
import 'package:carbon_footprint_tracker/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppContent extends StatefulWidget {
  const AppContent({super.key});

  @override
  State<AppContent> createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  late EmissionProvider _emissionProvider;

  @override
  void initState() {
    _emissionProvider = Provider.of<EmissionProvider>(context, listen: false);
    if (_emissionProvider.perCategoryStats == null) {
      Future.delayed(
          Duration.zero, () async => await _emissionProvider.initData(null));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(<Widget>[
      const DatePickerWidget(),
      const DayButtonWidget(),
      Consumer<EmissionProvider>(builder: (context, emissionProvider, _) {
        if (emissionProvider.perCategoryStats == null) {
          return const LoadingWidget();
        }
        final perCategoryStats = emissionProvider.perCategoryStats!;
        if (perCategoryStats.isEmpty) {
          return const NoDataWidget();
        }
        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List<Widget>.generate(
                perCategoryStats.length,
                (index) =>
                    CustomListTile(emissionData: perCategoryStats[index])));
      })
    ]));
  }
}
