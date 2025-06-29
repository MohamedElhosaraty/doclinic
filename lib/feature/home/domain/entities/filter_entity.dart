import 'package:equatable/equatable.dart';

import 'home_entity.dart';

class FilterEntity extends Equatable {
  final String message;
  final List<DoctorListEntity> doctorList;

  const FilterEntity({required this.message, required this.doctorList});

  @override
  List<Object?> get props => [message, doctorList];
}
