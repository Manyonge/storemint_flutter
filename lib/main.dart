import 'package:flutter/material.dart';
import 'package:storemint_flutter/screens/auth/categories.dart';
import 'package:storemint_flutter/screens/auth/conditions.dart';
import 'package:storemint_flutter/screens/auth/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storemint_flutter/screens/auth/products.dart';
import 'package:storemint_flutter/screens/auth/sizes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Storemint Flutter',
        routes: Routes.getRoutes(),
        debugShowCheckedModeBanner: false,
        
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => Login(),
    '/products': (context)=> Products(),
    '/conditions': (context)=> Conditions(),
'/categories': (context)=>Categories(),
'/sizes': (context)=>Sizes()

    };
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return routes;
  }
}