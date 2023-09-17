import 'package:carbon_footprint_tracker/models/category.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CategoryDataEntryDialog extends StatelessWidget {
  const CategoryDataEntryDialog({super.key, required this.categoryData});
  final CategoryModel categoryData;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SimpleDialog(
        alignment: Alignment.center,
        insetPadding: const EdgeInsets.all(10),
        contentPadding: const EdgeInsets.all(20),
        title: Text(categoryData.name),
        children: [
          Lottie.asset(categoryData.lottieURL,
              height: constraints.maxWidth,
              width: constraints.maxWidth,
              repeat: true,
              fit: BoxFit.contain,
              alignment: Alignment.center),
          Text(
            categoryData.description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 30),
          TextField(
              decoration: InputDecoration(
                  labelText: categoryData.label,
                  hintText: categoryData.hintText),
              keyboardType: TextInputType.number),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 16),
                      ),
                    )),
              ),
              const SizedBox(width: 25),
              Expanded(
                flex: 2,
                child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 16),
                      ),
                    )),
              )
            ],
          )
        ],
      );
    });
  }
}
