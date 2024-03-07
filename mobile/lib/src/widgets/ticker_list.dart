import 'package:flutter/material.dart';
import 'package:mobile/src/widgets/ticker_item.dart';

import '../models/ticker.dart';
import '../services/ticker_service.dart';

class TickerListWidget extends StatelessWidget {
    const TickerListWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ticker>>(
      future: getTickers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Ticker>? tickers = snapshot.data;

          if (tickers != null && tickers.isNotEmpty) {
            return ListView.builder(
              itemCount: tickers.length,
              itemBuilder: (context, index) {
                return TickerItemWidget(ticker: tickers[index]);
              },
            );
          } else {
            return Center(child: Text('Ticker not found.'));
          }
        }
      },
    );
  }
}

