import 'package:carbon_footprint_tracker/views/homescreen/add_data_bottom_sheet_content.dart';
import 'package:flutter/material.dart';

class AddDataButton extends StatelessWidget {
  const AddDataButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextButton.icon(
      onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          enableDrag: true,
          showDragHandle: true,
          context: context,
          builder: (context) => const AddDataBottomSheetContent()),
      icon: const Icon(Icons.add),
      label: const Text("Add Data"));
}
