import 'package:carbon_footprint_tracker/models/category.dart';
import 'package:carbon_footprint_tracker/providers/emission_provider.dart';
import 'package:carbon_footprint_tracker/widgets/custom_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CategoryDataEntryDialog extends StatefulWidget {
  const CategoryDataEntryDialog({super.key, required this.categoryData});
  final CategoryModel categoryData;

  @override
  State<CategoryDataEntryDialog> createState() =>
      _CategoryDataEntryDialogState();
}

class _CategoryDataEntryDialogState extends State<CategoryDataEntryDialog> {
  late EmissionProvider _emissionProvider;
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _emissionProvider = Provider.of<EmissionProvider>(context, listen: false);
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (context, constraints) => SimpleDialog(
              alignment: Alignment.center,
              insetPadding: const EdgeInsets.all(10),
              contentPadding: const EdgeInsets.all(20),
              title: Text(widget.categoryData.name),
              children: [
                Lottie.asset(widget.categoryData.lottieURL,
                    height: constraints.maxWidth,
                    width: constraints.maxWidth,
                    repeat: true,
                    fit: BoxFit.contain,
                    alignment: Alignment.center),
                Text(widget.categoryData.description,
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 30),
                TextField(
                    decoration: InputDecoration(
                        labelText: widget.categoryData.label,
                        hintText: widget.categoryData.hintText),
                    keyboardType: TextInputType.number),
                const SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomDialogButton(
                          text: "Cancel", onTap: () => Navigator.pop(context)),
                      const SizedBox(width: 25),
                      CustomDialogButton(
                          flex: 2,
                          onTap: () {
                            final selectedDate = _emissionProvider.selectedDate;
                            _emissionProvider.setData(
                                selectedDate,
                                widget.categoryData.id,
                                double.parse(_textEditingController.text));
                            Navigator.pop(context);
                          },
                          text: "Save")
                    ])
              ]));
}
