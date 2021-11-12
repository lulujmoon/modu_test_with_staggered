import 'package:flutter/material.dart';
import 'package:modu_test_with_staggered/screens/join/join_screen.dart';
import 'package:modu_test_with_staggered/screens/main/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modu_test_with_staggered/screens/new_transaction/new_transaction_screen.dart';
import 'package:modu_test_with_staggered/screens/service/service_screen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modu Test with Staggered Grid View',
      initialRoute: '/main',
      routes: {
        '/main': (context)=> const MainScreen(),
        '/new_transaction': (context)=> const NewTransactionScreen(),
        '/service': (context)=> const ServiceScreen(),
        '/join': (context)=> JoinScreen()
      },
    );
  }
}
