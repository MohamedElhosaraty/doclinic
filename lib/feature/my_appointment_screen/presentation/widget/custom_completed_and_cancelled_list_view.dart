import 'package:flutter/material.dart';

import 'custom_completed_and_cancelled_item.dart';

class CustomCompletedAndCancelledListView extends StatelessWidget {
  const CustomCompletedAndCancelledListView({super.key,  this.isCancelled = false});

  final bool isCancelled;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return CustomCompletedAndCancelledItem(
          isCancelled: isCancelled,
        );
      },
    );
  }
}
