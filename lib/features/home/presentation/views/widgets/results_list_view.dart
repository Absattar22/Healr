import 'package:flutter/material.dart';
import 'package:healr/features/home/presentation/views/widgets/test_results_container.dart';

class ResultsListView extends StatelessWidget {
  const ResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const TestResultsContainer();
      },
    );
  }
}
