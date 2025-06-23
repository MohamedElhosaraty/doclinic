import 'package:doclinic/feature/home/presentation/widgets/specialization_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/home_entity.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({super.key, required this.homeEntity, required this.onChanged,});

  final ValueChanged<int> onChanged;
  final HomeEntity homeEntity;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {

  var selectedSpecializationIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.homeEntity.specializationList.length,
          itemBuilder: (context , index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedSpecializationIndex = index ;
                  widget.onChanged(index);
                });
              },
              child: SpecializationListViewItem(
                nameSpecialization: widget.homeEntity.specializationList[index].nameSpecialization,
                itemIndex: index,
                selectedIndex : selectedSpecializationIndex,
              ),
            );
          }
      ),
    );
  }
}