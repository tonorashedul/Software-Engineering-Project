import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  //final Future<FirebaseApp> _initialization = Firebase.initializeApp()
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot)
        {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const MaterialApp(
              home:  Scaffold(
                body: Center(
                  child: Text('Tutors Planet app is being initialized',
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            );
          }
          else if(snapshot.hasError)
          {
            const MaterialApp(
              home:  Scaffold(
                body: Center(
                  child: Text('An error has been occurred',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            );
          }
          return MaterialApp(
            title: 'Tutors Planet',
            theme: ThemeData (
              scaffoldBackgroundColor: Colors.black,
              primarySwatch: Colors.blue,
            ),
            home: const Scaffold(),
          );
        }

    );

  }
}
