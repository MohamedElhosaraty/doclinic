import 'package:doclinic/feature/home/presentation/widgets/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctor_speciality_see_all.dart';
import 'doctors_shimmer_loading.dart';

class SpecialityAndDoctorLoading extends StatelessWidget {
  const SpecialityAndDoctorLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DoctorSpecialitySeeAll(
          title: "Doctor Speciality",
          onPressed: (){},
        ),
        18.verticalSpace,
        const SpecialityShimmerLoading(),
        25.verticalSpace,
        DoctorSpecialitySeeAll(
          onPressed: (){},
          title: "Recommended Doctors",),
        12.verticalSpace,
        const DoctorsShimmerLoading(),
      ],
    );
  }
}
