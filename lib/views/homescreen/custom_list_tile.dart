import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Card(
          color: const Color(0xff2f2f2f),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Padding(
              padding: EdgeInsets.all(10.0), child: Icon(Icons.car_crash))),
      subtitle: const Text("At 15:18 for 26 mins"),
      title: const Text("Car"),
      trailing: const Text("7.23 kg"),
    );
  }
}
