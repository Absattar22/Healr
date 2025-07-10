import 'package:flutter/material.dart';
import 'package:healr/features/home/presentation/views/widgets/results_list_view.dart';
import 'package:healr/features/home/presentation/views/widgets/test_results_app_bar.dart';

class TestResultsViewBody extends StatelessWidget {
  const TestResultsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TestResultsAppBar(),
              ResultsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
