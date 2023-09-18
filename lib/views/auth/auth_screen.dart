import 'package:carbon_footprint_tracker/constants/assets.dart';
import 'package:carbon_footprint_tracker/constants/universal.dart';
import 'package:carbon_footprint_tracker/models/user_model.dart';
import 'package:carbon_footprint_tracker/providers/user_provider.dart';
import 'package:carbon_footprint_tracker/utils/universal.dart';
import 'package:carbon_footprint_tracker/views/homescreen/home_screen.dart';
import 'package:carbon_footprint_tracker/widgets/custom_dialog_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _emissionController;
  late UserProvider _userProvider;
  late bool isLoading;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    isLoading = false;
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _emissionController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _emissionController.dispose();
    super.dispose();
  }

  handleSignUp() async {
    setState(() => isLoading = true);
    if (_formKey.currentState!.validate()) {
      try {
        final userCred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);
        final uid = userCred.user!.uid;
        final dailyLimit = double.parse(_emissionController.text);
        final name = _nameController.text.trim();
        final userData =
            UserModel(dailyLimit: dailyLimit, name: name, uid: uid);
        await _userProvider.setData(userData);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            content: Text(error.message ?? "Error")));
      }
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
          child: SafeArea(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Lottie.asset(co2LottieURL,
                                frameRate: FrameRate.max),
                            const Text(appTitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2)),
                            const SizedBox(height: 20),
                            TextFormField(
                                controller: _nameController,
                                enabled: !isLoading,
                                validator: nameValidator,
                                decoration: const InputDecoration(
                                    labelText: "Name", hintText: "Name"),
                                keyboardType: TextInputType.name),
                            const SizedBox(height: 15),
                            TextFormField(
                                controller: _emailController,
                                enabled: !isLoading,
                                validator: emailValidator,
                                decoration: const InputDecoration(
                                    labelText: "Email",
                                    hintText: "example@abc.com"),
                                keyboardType: TextInputType.emailAddress),
                            const SizedBox(height: 15),
                            TextFormField(
                                controller: _passwordController,
                                enabled: !isLoading,
                                decoration: const InputDecoration(
                                    labelText: "Password",
                                    hintText: "Enter a strong password"),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true),
                            const SizedBox(height: 15),
                            TextFormField(
                                controller: _emissionController,
                                enabled: !isLoading,
                                validator: carbonLimitValidator,
                                decoration: const InputDecoration(
                                    labelText: "Daily Carbon Limit",
                                    hintText: "Enter Value in kg"),
                                keyboardType: TextInputType.number),
                            const SizedBox(height: 30),
                            CustomDialogButton(
                                isLoading: isLoading,
                                onTap: handleSignUp,
                                text: 'Proceed',
                                isExpanded: false)
                          ]))))));
}
