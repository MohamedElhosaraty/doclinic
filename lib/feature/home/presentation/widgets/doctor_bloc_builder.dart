import 'package:doclinic/core/helpers/extensions.dart';
import 'package:doclinic/feature/home/domain/entities/home_entity.dart';
import 'package:doclinic/feature/home/presentation/widgets/speciality_and_doctor_loading.dart';
import 'package:doclinic/feature/home/presentation/widgets/speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../cubit/home_cubit/home_cubit.dart';
import 'doctor_list_view.dart';
import 'doctor_speciality_see_all.dart';

class DoctorBlocBuilder extends StatefulWidget {
  const DoctorBlocBuilder({super.key});

  @override
  State<DoctorBlocBuilder> createState() => _DoctorBlocBuilderState();
}

class _DoctorBlocBuilderState extends State<DoctorBlocBuilder> {
  int indexDoctor = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return Column(
              children: [
                DoctorSpecialitySeeAll(
                  title: "Doctor Speciality",
                  onPressed: (){
                    context.pushNamed(Routes.doctorSpecialityScreen , arguments: state.homeEntity );
                  },
                ),
                18.verticalSpace,
                SpecialityListView(
                  homeEntity: state.homeEntity,
                  onChanged: (index) {
                    setState(() {
                      indexDoctor = index;
                    });
                  },
                ),
                25.verticalSpace,
                DoctorSpecialitySeeAll(
                  onPressed: () {
                    List<DoctorListEntity> doctorList = context.read<HomeCubit>().doctors;
                    context.pushNamed(Routes.recommendationDoctorScreen , arguments: {
                      "cityEntity": context.read<HomeCubit>().city,
                      "doctorList": doctorList
                    }  );
                  },
                  title: "Recommended Doctors",
                ),
                12.verticalSpace,
                DoctorListView(
                  doctorList:
                      state
                          .homeEntity
                          .specializationList[indexDoctor]
                          .doctorList,
                ),
              ],
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          } else if (state is HomeLoading) {
            return const SpecialityAndDoctorLoading();
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
