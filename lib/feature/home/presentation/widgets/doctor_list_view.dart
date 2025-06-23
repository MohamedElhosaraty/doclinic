import 'package:doclinic/core/helpers/extensions.dart';
import 'package:doclinic/feature/home/domain/entities/home_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import 'doctor_list_view_item.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key, required this.doctorList, });

  final List<DoctorListEntity> doctorList ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              context.pushNamed(Routes.detailsDoctorScreen , arguments: doctorList[index]);
            },
            child: DoctorListViewItem(
              doctorList: doctorList[index],
            ),
          );
        },
      ),
    );
  }
}
