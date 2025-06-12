import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:petquest/auth/login.dart';
import 'package:petquest/components/textformfield.dart';
import 'package:petquest/components/custom_button.dart';
import 'package:petquest/home.dart';

final fullNameProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
final numberProvider = StateProvider<String>((ref) => '');
final addressProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final confirmPasswordProvider = StateProvider<String>((ref) => '');

final fullNameControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});
final emailControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});
final numberControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});
final addressControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});
final passwordControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});
final confirmPasswordControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

class Signup extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullNameController = ref.watch(fullNameControllerProvider);
    final emailController = ref.watch(emailControllerProvider);
    final numberController = ref.watch(numberControllerProvider);
    final addressController = ref.watch(addressControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    final confirmPasswordController = ref.watch(confirmPasswordControllerProvider);

    return Scaffold(
      backgroundColor: Color(0xFFF7F6CF),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign Up',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            CustomTextForm(
              hinttext: 'Full Name',
              mycontroller: fullNameController,
            ),
            SizedBox(height: 20),
            CustomTextForm(
              hinttext: 'Enter your Email',
              mycontroller: emailController,
            ),
            SizedBox(height: 20),
            CustomTextForm(
              hinttext: 'Phone Number',
              mycontroller: numberController,
            ),
            SizedBox(height: 20),
            CustomTextForm(
              hinttext: 'Address',
              mycontroller: addressController,
            ),
            SizedBox(height: 20),
            CustomTextForm(
              hinttext: 'Enter your Password',
              mycontroller: passwordController,
            ),
            SizedBox(height: 20),
            CustomTextForm(
              hinttext: 'Confirm your Password',
              mycontroller: confirmPasswordController,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Sign Up',
              onPressed: ()  async {
                // Handle Sign-Up
                ref.read(fullNameProvider.notifier).state = fullNameController.text;
                ref.read(emailProvider.notifier).state = emailController.text;
                ref.read(numberProvider.notifier).state = numberController.text;
                ref.read(addressProvider.notifier).state = addressController.text;
                ref.read(passwordProvider.notifier).state = passwordController.text;
                ref.read(confirmPasswordProvider.notifier).state = confirmPasswordController.text;
                // Add your sign-up logic here
                try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  );
  Get.to(Home()); 
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
              },
              backgroundColor: Color(0xFFB6D8F2),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Login
                Get.off(Login());
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}