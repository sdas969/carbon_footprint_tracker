import 'package:flutter/material.dart';

class AddDataBottomSheetContent extends StatelessWidget {
  const AddDataBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        builder: (context, controller) =>
            LayoutBuilder(builder: (context, constraints) {
              return GridView.builder(
                  controller: controller,
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => Card(
                        color: Colors.amber,
                      ));
            }));
  }
}
