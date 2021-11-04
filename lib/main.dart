import 'package:flutter/material.dart';
import 'package:modu_test_with_staggered/screens/main/main_screen.dart';
import 'package:modu_test_with_staggered/screens/new_transaction/new_transaction_screen.dart';
import 'package:modu_test_with_staggered/screens/service/service_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modu Test with Staggered Grid View',
      home: NewTransactionScreen(),
    );
  }
}
