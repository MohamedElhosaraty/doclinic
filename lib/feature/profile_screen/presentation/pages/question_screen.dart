import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../widget/custom_setting_app_bar.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});

  final List<Map<String, String>> faqs = [
    {
      "question": "What should I expect during a doctor's appointment?",
      "answer":
      "During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
    },
    {
      "question": "What should I bring to my doctor's appointment?",
      "answer": "You should bring your ID, insurance card, list of medications, and any relevant medical records or test results.",
    },
    {
      "question": "What if I need to cancel or reschedule my appointment?",
      "answer": "Please contact the clinic at least 24 hours in advance to cancel or reschedule your appointment.",
    },
    {
      "question": "How do I make an appointment with a doctor?",
      "answer": "You can call the clinic or use our online booking system to make an appointment.",
    },
    {
      "question": "How long will my doctor's appointment take?",
      "answer": "The length of a doctor's appointment can vary depending on the reason for your visit. On average, a typical appointment lasts between 15 to 30 minutes. However, if you're seeing a specialist or discussing multiple health concerns, it may take longer.",
    },
    {
      "question": "How much will my doctor's appointment cost?",
      "answer": "The cost of a doctor's appointment depends on several factors including your location, the type of doctor you're seeing, whether you have health insurance, and the services provided during the visit. It's best to contact the clinic or check with your insurance provider for a cost estimate.",
    },
    {
      "question": "What should I look for in a good doctor?",
      "answer": "A good doctor listens carefully, communicates clearly, shows empathy, and involves you in decisions about your health. Look for someone who is respectful, experienced in your health concerns, and makes you feel comfortable and understood.",
    },
  ];

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
                  title: "FQA",isActionButton: true,isSearch: true,
                ),
                32.verticalSpace,
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: faqs.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                    itemBuilder: (context, index) => Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent, // يمنع الخط الداخلي
                      ),
                      child: ExpansionTile(
                        textColor: AppColors.dartBlue,
                        iconColor: AppColors.dartBlue,
                        title: Transform.translate(
                          offset: const Offset(-18, 0),
                          child: Text(
                            faqs[index]["question"]!,style: AppTextStyles.font16Medium(context).copyWith(
                            color: AppColors.dartBlue
                          ),),
                        ),
                        children:  [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Text(
                              faqs[index]["answer"]!,style: AppTextStyles.font12Regular(context).copyWith(
                              color: AppColors.grey
                            ),),
                          ),
                        ],),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,)
              ],
            ),
          ),),
    );
  }
}
