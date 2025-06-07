import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'shared/auth_ui.dart'; 
import '../views/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;
  bool rememberMe = false;

  void toggleObscure() => setState(() => obscureText = !obscureText);

  void handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final success = AuthController.login(email, password);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(success ? 'Success' : 'Error'),
        content: Text(success ? 'Login Successful!' : 'Invalid email or password.'),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildAuthUI(
      context,
      title: 'Login',
      buttonText: 'Login',
      onSubmit: handleLogin,
      emailController: emailController,
      passwordController: passwordController,
      obscureText: obscureText,
      toggleObscure: toggleObscure,
      rememberMe: rememberMe,
      onRememberChanged: (val) => setState(() => rememberMe = val ?? false),
      footerText: "Don't have an account?",
      footerActionText: 'Sign up',
      onFooterAction: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupView()));
      },
    );
  }
}
