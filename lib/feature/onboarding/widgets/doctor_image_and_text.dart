import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/app_text_styles.dart';
import '../../../generated/assets.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
            Assets.svgsDoctorLogoOpacity,),
        Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.14, .4]
              ),
            ),
            child:  Image.asset(
              Assets.imagesOnboardingDoctor,)
        ),
        Positioned(
            bottom: 30,
            left: 43,
            right: 43,
            child: Text(
              " Best Doctor Appointment App ",
              textAlign: TextAlign.center,
              style: AppTextStyles.font32Bold(context).copyWith(
                  height: 1.4
              ),
            )),
      ],
    );
  }
}