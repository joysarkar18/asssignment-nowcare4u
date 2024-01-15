import 'package:assignment_nowcare4u/auth/api/google_signIn_api.dart';
import 'package:assignment_nowcare4u/auth/screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          LottieBuilder.asset(
            "assets/hii_animation.json",
            frameRate: FrameRate.max,
            width: MediaQuery.of(context).size.width,
          ),
          const Text(
            "Hello from Joy!",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Text(
            "Login with - ${FirebaseAuth.instance.currentUser!.email}",
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Are you sure you want to log out?"),
                      content: const Text(""),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            child: const Text(
                              "No",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await signOut();
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            child: const Text(
                              "Yes",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Text("Log out")),
          )
        ],
      ),
    );
  }
}
