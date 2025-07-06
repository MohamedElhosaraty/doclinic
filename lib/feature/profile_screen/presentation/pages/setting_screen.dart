import 'package:doclinic/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../generated/assets.dart';
import '../widget/custom_setting_app_bar.dart';
import '../widget/custom_setting_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              16.verticalSpace,
              CustomSettingAppBar(
                title: "Settings",isActionButton: false,),
              32.verticalSpace,
              CustomSettingItem(
                title: "Notifications",
                imageString: Assets.svgsNotification2,
                onPressed: (){},),
              CustomSettingItem(
                title: "FQA",
                imageString: Assets.svgsQuestion,
                onPressed: (){
                  context.pushNamed(Routes.questionScreen);
                },),
              CustomSettingItem(
                title: "Security",
                imageString: Assets.svgsLock,
                onPressed: (){},),
              CustomSettingItem(
                title: "Language",
                imageString: Assets.svgsLanguage,
                onPressed: (){},),
              CustomSettingItem(
                title: "Logout",
                imageString: Assets.svgsLogout,
                onPressed: (){},isLogout: true,),
          ],
          ),
        ),
      ),
    );
  }
}
