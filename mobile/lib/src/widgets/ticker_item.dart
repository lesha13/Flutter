import 'package:flutter/material.dart';

import '../models/ticker.dart';

// class TickerItemWidget extends StatelessWidget {
//   const TickerItemWidget({Key? key, required this.ticker}) : super(key: key);
//   final Ticker ticker;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         ticker.ticker ?? 'N/A',
//         style: TextStyle(fontSize: 20),
//       ),
//       subtitle: Text(
//         'Quantity: ${ticker.quantity ?? 'N/A'}',
//       ),
//     );
//   }
// }

class TickerItemWidget extends StatefulWidget {
  const TickerItemWidget({Key? key, required this.ticker}) : super(key: key);
  final Ticker ticker;

  @override
  State<TickerItemWidget> createState() => _TickerItemWidgetState();
}

class _TickerItemWidgetState extends State<TickerItemWidget> {
  int quantity = 0;

  void grow() {
    setState(() {
      quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          widget.ticker.ticker ?? "N/A",
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          'Quantity: $quantity',
        ),
        onTap: () => grow(),
      );
  }
}