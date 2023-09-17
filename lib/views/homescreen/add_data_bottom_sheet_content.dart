import 'package:carbon_footprint_tracker/constants/bottom_sheet.dart';
import 'package:carbon_footprint_tracker/views/homescreen/category_widget.dart';
import 'package:flutter/material.dart';

class AddDataBottomSheetContent extends StatelessWidget {
  const AddDataBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
      snap: true,
      snapSizes: const [0.5, 0.75],
      expand: false,
      builder: (context, controller) => LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              controller: controller,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child:
                            Text("Categories", style: TextStyle(fontSize: 30))),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller,
                        itemCount: categories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: constraints.maxWidth > 600 ? 4 : 2),
                        itemBuilder: (context, index) =>
                            CategoryWidget(categoryData: categories[index]!))
                  ]))));
}
