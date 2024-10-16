import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storemint_flutter/components/bottom_navigation.dart';


class Conditions extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: mainBottomNav(ref, context),
      appBar: AppBar(
        title: Text('Conditions')
      ),
    );
  }
}
