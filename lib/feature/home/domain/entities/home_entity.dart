import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final List<SpecializationEntity> specializationList;

  const HomeEntity({required this.specializationList});
  @override
  List<Object?> get props => [specializationList];
}

class SpecializationEntity extends Equatable {
  final int id;
  final String nameSpecialization;
  final List<DoctorListEntity> doctorList;

  const SpecializationEntity({required this.id, required this.nameSpecialization, required this.doctorList});

  @override
  List<Object?> get props => [id, nameSpecialization];
}

class DoctorListEntity extends Equatable {
  final int doctorId;
  final String nameDoctor;
  final String email;
  final String phone;
  final String image;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final String price;
  final CityEntity cityEntity;
  final String startTime;
  final String endTime;

  const DoctorListEntity({
    required this.cityEntity,
    required this.nameDoctor,
    required this.email,
    required this.phone,
    required this.image,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.price,
    required this.doctorId,
    required this.startTime,
    required this.endTime,
  });

  @override
  List<Object?> get props => [
    nameDoctor,
    email,
    phone,
    image,
    gender,
    address,
    description,
    degree,
    price,
    doctorId,
    cityEntity,
    startTime,
    endTime
  ];
}

class CityEntity extends Equatable {
  final int id;
  final String nameCity;
  final GovernrateEntity governrateEntity;
  const CityEntity({required this.id, required this.nameCity ,required this.governrateEntity});

  @override
  List<Object?> get props => [id, nameCity, governrateEntity];
}

class GovernrateEntity extends Equatable {
  final int id;
  final String nameGovernrate;
  const GovernrateEntity({required this.id, required this.nameGovernrate});

  @override
  List<Object?> get props => [id, nameGovernrate];
}
