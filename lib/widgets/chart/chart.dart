import 'package:expenses_app/Models/expanses.dart';
import 'package:expenses_app/widgets/chart/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<Expansesmodel> expenses;
  List<ExpansesBucket> get buckets {
    return [
      ExpansesBucket.forCategory(expenses, Category.food),
      ExpansesBucket.forCategory(expenses, Category.leisure),
      ExpansesBucket.forCategory(expenses, Category.travel),
      ExpansesBucket.forCategory(expenses, Category.work),
    ];
  }

  get maxTotalAmount {
    double max = 0;
    for (final bucket in buckets) {
      if (bucket.totalAmount > max) {
        max = bucket.totalAmount;
      }
    }
    return max;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.2),
            Theme.of(context).colorScheme.primary.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: bucket.totalAmount == 0
                        ? 0
                        // Bug 7: 
                        : maxTotalAmount / bucket.totalAmount,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryicon[bucket.category],
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
