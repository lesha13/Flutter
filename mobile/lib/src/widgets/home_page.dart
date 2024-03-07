import 'package:flutter/material.dart';
import 'package:mobile/src/widgets/navigation.dart';


import 'ticker_list.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);
  static String route = "/"; 
  
  @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Investments'),
        ),
        body: const TickerListWidget(),
        bottomNavigationBar: getBottomNavigationBar(context),
    );
  }
}
