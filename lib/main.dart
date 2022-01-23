import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pagess/Home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initalzation = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initalzation,
      builder: (context, snapshot) {
        //Chek for error
        if (snapshot.hasError) {
          print("Somthing went wrong");
        }
        //once completed ,show youre application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter CURD Operation',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
