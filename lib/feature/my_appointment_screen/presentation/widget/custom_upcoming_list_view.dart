import 'package:doclinic/feature/my_appointment_screen/presentation/widget/custom_upcoming_item.dart';
import 'package:flutter/material.dart';

class CustomUpcomingListView extends StatelessWidget {
  const CustomUpcomingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const CustomUpcomingItem();
      },
    );
  }
}
