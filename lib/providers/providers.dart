import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storemint_flutter/models/category.dart';
import 'package:http/http.dart' as http;


final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});

@riverpod
Future<Category> category (WidgetRef ref) async {
  final response = await http.get(Uri.https('dripventory.storemint.shop', '/api/categories?retailerId=1'));
  
  // Check if the response is successful
  if (response.statusCode == 200) {
    // Parse and return the Category object
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    print({json});
    return Category.fromJson(json);
  } else {
    throw Exception('Failed to load categories ${response.body.toString()}');
  }
}
