import 'package:flutter/material.dart';
import 'package:swiftdine_app/controllers/auth_controller.dart';
import '../views/shared/auth_ui.dart';
import '../views/login_screen.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  void toggleObscure() => setState(() => obscureText = !obscureText);

  void handleSignup() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final success = AuthController.signup(email, password);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(success ? 'Success' : 'Error'),
        content: Text(success
            ? 'Signup Successful! Please login.'
            : 'User already exists. Please login.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (success) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildAuthUI(
      context,
      title: 'Sign Up',
      buttonText: 'Sign Up',
      onSubmit: handleSignup,
      emailController: emailController,
      passwordController: passwordController,
      obscureText: obscureText,
      toggleObscure: toggleObscure,
      rememberMe: false,
      onRememberChanged: null, // No "Remember me" in signup
      footerText: 'Already have an account?',
      footerActionText: 'Login',
      onFooterAction: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      },
    );
  }
}
