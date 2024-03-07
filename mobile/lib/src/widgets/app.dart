import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePageWidget.route,
      routes: {
        HomePageWidget.route: (context) => const HomePageWidget(),
        LoginWidget.route: (context) => const LoginWidget(),
      },
    );
  }
}
