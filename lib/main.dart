import 'dart:async';
import 'package:apiii/services.dart';
import 'package:apiii/user_model..dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Users> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Users>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.data![5].email.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}


// import 'package:apiii/services.dart';
// import 'package:apiii/user_model..dart';
// import 'package:flutter/material.dart';

// void main() async {
//   var userModel = await APIService.getUsers();
//   userModel!.data!.forEach((element) {
//     print(element.email);
//   });
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     // futureUsers = ();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: FutureBuilder<Users>(
//           // future: ,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                   itemCount: userModel!.data!.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: Text(snapshot.data?.length),
//                     );
//                   });
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }

//             // By default, show a loading spinner.
//             return const CircularProgressIndicator();
//           },
//         ));
//   }
// }
