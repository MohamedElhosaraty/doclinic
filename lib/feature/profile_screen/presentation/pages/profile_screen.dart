import 'package:flutter/material.dart';

import '../../../../core/theming/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Profile Screen",style: AppTextStyles.font24Bold(context),),
          ],
        ));
  }
}
