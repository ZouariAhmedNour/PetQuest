import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:petquest/auth/signup.dart';
import 'package:petquest/components/textformfield.dart';
import 'package:petquest/components/custom_button.dart';

final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final emailControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});
final passwordControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

class Login extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final emailController = ref.watch(emailControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);

    return Scaffold(
      backgroundColor: Color(0xFFF7F6CF),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'With Google',
              onPressed: () {
                // Handle Google Sign-In
              },
              icon: Icons.g_mobiledata,
              backgroundColor: Color(0xFFB6D8F2),
            ),
            SizedBox(height: 20),
            Text('Or with Email',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            CustomTextForm(
              hinttext: 'Enter your Email',
              mycontroller: emailController,
            ),
            SizedBox(height: 20),
            CustomTextForm(
              hinttext: 'Enter your Password',
              mycontroller: passwordController,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Get Started',
              onPressed: () {
                // Handle Email Sign-In
                ref.read(emailProvider.notifier).state = emailController.text;
                ref.read(passwordProvider.notifier).state = passwordController.text;
                // Add your sign-in logic here
              },
              icon: Icons.pets,
              backgroundColor: Color(0xFFB6D8F2),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Sign Up
                Get.off(Signup());
              },
              child: Text('New User? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}