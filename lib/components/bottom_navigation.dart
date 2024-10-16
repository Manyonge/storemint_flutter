import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storemint_flutter/providers/providers.dart';

NavigationBar mainBottomNav(WidgetRef ref, BuildContext context){
final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
const routes =[
  '/products',
  '/categories',
  '/conditions',
  '/sizes',
];
  return NavigationBar(
    onDestinationSelected: (value) {
      ref.read(indexBottomNavbarProvider.notifier).update((state) => value);
      Navigator.pushNamed(context, routes[value]);
    },
    selectedIndex: indexBottomNavbar,
   destinations: const <Widget>[
    NavigationDestination(icon: Icon(Icons.shopping_bag), label: 'Products'),
    NavigationDestination(icon: Icon(Icons.category), label: 'Categories'),
    NavigationDestination(icon: Icon(Icons.warning), label: 'Conditions'),
    NavigationDestination(icon: Icon(Icons.format_size), label: 'Sizes'),
  ]);}