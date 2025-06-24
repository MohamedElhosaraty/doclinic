import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/home_entity.dart';
import '../cubit/search_cubit/search_cubit.dart';
import 'doctor_list_view.dart';
import 'doctors_shimmer_loading.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key, required this.doctorList});

  final List<DoctorListEntity> doctorList;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return DoctorsShimmerLoading();
        }else if (state is SearchError) {
          return Center(
            child: Text(state.error.toString()),
          );
        }else if (state is SearchSuccess) {
          return DoctorListView(
            doctorList: state.searchList,
          );
        }else if (state is SearchEmpty) {
          return Center(
            child: Text('No Doctors Found'),
          );
        }
        return DoctorListView(
          doctorList: doctorList,
        );
      },
    );
  }
}
