import 'package:flutter/material.dart';
import 'package:mobile/src/widgets/ticker_item.dart';

import '../models/ticker.dart';
import '../services/ticker_service.dart';

class TickerItemShowWidget extends StatelessWidget {
  final int id;
  TickerItemShowWidget({required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Ticker?>(
      future: getTicker(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          Ticker? ticker = snapshot.data;

          if (ticker != null) {
            return TickerItemWidget(ticker: ticker);
          } else {
            return Center(child: Text('Ticker not found.'));
          }
        }
      },
    );
  }
}