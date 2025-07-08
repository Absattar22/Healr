import 'package:flutter/material.dart';
import 'package:healr/features/home/presentation/views/widgets/bottom_nav_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomNavBar(),
    );
  }
}
