import 'package:flutter/material.dart';

import '../../../../core/theming/app_text_styles.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("My Appointment",style: AppTextStyles.font24Bold(context),),
          ],
        ));
  }
}
