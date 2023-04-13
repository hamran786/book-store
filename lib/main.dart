import 'package:book_store/pages/home_Page.dart';
import 'package:book_store/pages/loging_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'classes/Provider_Class.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => theameProvider(), child: (MyApp())));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness:Provider.of<theameProvider>(context).lightmode),


      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Loging();
          } else {
            return Loging();
          }
        },
      ),
    );
  }
}
