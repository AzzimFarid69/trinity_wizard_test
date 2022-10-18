import 'package:flutter/material.dart';
import 'package:trinity_wizard_test/contact_details.dart';
import 'package:trinity_wizard_test/contacts_main.dart';

class Routes {
  static const String home = '/';
  static const String details = '/details';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => ContactsMain(),
        );
      case Routes.details:
        {
          Map map = settings.arguments;
          return MaterialPageRoute(
            builder: (_) => ContactsDetails(
              ob: map,
            ),
          );
        }
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('Error'),
          ),
        );
      },
    );
  }
}
