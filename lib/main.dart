import 'package:flutter/material.dart';
import 'package:trinity_wizard_test/contacts_main.dart';
import 'package:trinity_wizard_test/utils/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do-List',
      initialRoute: Routes.home,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: ContactsMain(),
    );
  }
}