import 'dart:async';

import 'package:doclinic/core/widgets/search_field.dart';
import 'package:doclinic/feature/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:doclinic/feature/home/presentation/widgets/search_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.dart';
import '../../domain/entities/home_entity.dart';
import '../cubit/search_cubit/search_cubit.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/doctors_shimmer_loading.dart';
import '../widgets/sort_bottom_sheet.dart';

class RecommendationDoctorScreen extends StatefulWidget {
  const RecommendationDoctorScreen(
      {super.key, required this.doctorList, required this.cityEntity});

  final List<DoctorListEntity> doctorList;
  final List<Map<String, dynamic>> cityEntity;

  @override
  State<RecommendationDoctorScreen> createState() =>
      _RecommendationDoctorScreenState();
}

class _RecommendationDoctorScreenState
    extends State<RecommendationDoctorScreen> {

  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onChanged(String nameDoctor) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      context.read<SearchCubit>().search(nameDoctor);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
          child: Column(
            children: [
              const CustomAppBar(
                title: "Recommendation Doctor", isActionButton: true,),
              32.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: SearchField(
                        controller: _controller,
                        onChanged: _onChanged,
                      )),
                  10.horizontalSpace,
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30)),
                          ),
                          builder: (_) =>
                              DraggableScrollableSheet(
                                  expand: false,
                                  initialChildSize: 0.45,  // بداية الارتفاع (50%)
                                  minChildSize: 0.2,      // أقل ارتفاع يمكن الوصول له
                                  maxChildSize: 0.5,      // أعلى ارتفاع يمكن الوصول له
                                builder: (context, scrollController){
                                  return SortBottomSheet(
                                    cityEntity: widget.cityEntity,
                                  );
                                }
                              ),
                        );
                      },
                      child: SvgPicture.asset(Assets.svgsSort)),
                ],
              ),
              25.verticalSpace,
              BlocBuilder<FilterCubit, FilterState>(
                builder: (context, state) {
                  if(state is FilterSuccess){
                    return SearchBlocBuilder(
                      doctorList: state.filterEntity.doctorList,
                    );
                  }else if(state is FilterLoading){
                    return const DoctorsShimmerLoading();}
                  return SearchBlocBuilder(
                    doctorList: widget.doctorList,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
