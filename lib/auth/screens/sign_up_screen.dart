import 'package:assignment_nowcare4u/auth/api/google_signIn_api.dart';
import 'package:assignment_nowcare4u/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 98, 238, 217),
      appBar: AppBar(
        title: const Text(
          "nowcare4u app",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 12, 12),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                GoogleSignInAccount? user = await logIn();

                if (user != null) {
                  print(user.id);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          email: user.email,
                          name: user.displayName!,
                        ),
                      ));
                } else {
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
              child: SizedBox(
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/google-logo-9827.png",
                      height: 30,
                      width: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "google sign in",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
