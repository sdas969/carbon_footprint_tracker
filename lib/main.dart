import 'package:carbon_footprint_tracker/base_screen.dart';
import 'package:carbon_footprint_tracker/firebase_options.dart';
import 'package:carbon_footprint_tracker/providers/emission_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => EmissionProvider())
      ], builder: (context, _) => const BaseScreen());
}
