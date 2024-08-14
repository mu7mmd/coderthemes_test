import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text('data'),
                Text('data'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
