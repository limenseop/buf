import 'dart:js';

import 'package:buf/ViewModel/LoginViewModel.dart';
import 'package:buf/ViewModel/SignupViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/Login/Login.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SignUpVIewModel()),
      ChangeNotifierProvider(create: (context)=>LoginViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

