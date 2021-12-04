import 'package:doctor_gopalganj/provider/doctor_provider.dart';
import 'package:doctor_gopalganj/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<DoctorProvider>
            (create: (_)=>DoctorProvider()),
        ],
      child: MyApp(),
    )
  );
}
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
