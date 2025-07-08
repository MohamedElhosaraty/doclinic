import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/custom_medical_record_item.dart';
import '../widget/custom_setting_app_bar.dart';

class MedicalRecordScreen extends StatelessWidget {
  const MedicalRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.verticalSpace,
                CustomSettingAppBar(
                  title: "Medical Record",isActionButton: true,
                ),
                32.verticalSpace,
                const CustomMedicalRecordItem(
                    title: "This Month",
                    title2: "End of observation",
                    title3: "Blood Analysis",
                    subtitle: "red blood cell : 4.10 million cells/mcL \n hemogoblin : 142 grams/L \n hematocrit : 33.6% \n white blood cells : 3.850 cells/mcL",
                    subtitle2: "red blood cell : 3.90 million cells/mcL \n hemogoblin : 122 grams/L \n hematocrit : 47.7% \n white blood cells : 4.300 cells/mcL",
                ),
                const CustomMedicalRecordItem(
                    title: "January",
                    title2: "End of observation",
                    title3: "Blood Analysis",
                    subtitle: "red blood cell : 4.30 million cells/mcL \n hemogoblin : 132 grams/L \n hematocrit : 37.7% \n white blood cells : 4.700 cells/mcL",
                    subtitle2: "red blood cell : 3.90 million cells/mcL \n hemogoblin : 118 grams/L \n hematocrit : 38.7% \n white blood cells : 4.500 cells/mcL",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
