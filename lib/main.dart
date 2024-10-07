import 'package:flutter/material.dart';
import 'package:storemint_flutter/screens/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: Routes.getRoutes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => Login(),
    };
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return routes;
  }
}