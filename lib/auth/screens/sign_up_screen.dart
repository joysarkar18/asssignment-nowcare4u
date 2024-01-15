import 'package:assignment_nowcare4u/auth/api/google_signIn_api.dart';
import 'package:assignment_nowcare4u/home_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 98, 238, 217),
      appBar: AppBar(
        title: const Text(
          "nowcare4u app",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 12, 12, 12),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                bool isLogin = await signInWithGoogle();
                if (isLogin) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                } else {
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("SomeThing Went Wrong"),
                      content:
                          const Text("Please check your internet connection"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            child: const Text(
                              "okay",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text("google sign in"))),
    );
  }
}
