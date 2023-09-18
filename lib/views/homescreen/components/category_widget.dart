import 'package:carbon_footprint_tracker/constants/universal.dart';
import 'package:carbon_footprint_tracker/models/category.dart';
import 'package:carbon_footprint_tracker/views/homescreen/components/category_data_entry_dialog.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categoryData});
  final CategoryModel categoryData;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: MaterialButton(
          elevation: 10,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () => showDialog(
              context: context,
              builder: (context) =>
                  CategoryDataEntryDialog(categoryData: categoryData)),
          color: appButtonColor.withOpacity(0.5),
          disabledColor: appButtonColor,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: LayoutBuilder(
                        builder: (context, constraints) => Icon(
                            categoryData.icon,
                            size: constraints.maxHeight / 1.25))),
                Text(categoryData.name, textAlign: TextAlign.center)
              ])));
}
