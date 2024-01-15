import 'package:assignment_nowcare4u/auth/screens/sign_up_screen.dart';
import 'package:assignment_nowcare4u/firebase_options.dart';
import 'package:assignment_nowcare4u/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? firebaseUser;
  @override
  void initState() {
    // TODO: implement initState
    firebaseUser = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: firebaseUser == null ? SignupScreen() : HomeScreen(),
    );
  }
}
