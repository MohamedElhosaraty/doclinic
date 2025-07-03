import 'package:equatable/equatable.dart';

class MyAppointmentEntity extends Equatable{

  final  List<DataEntity> data;

  const MyAppointmentEntity({required this.data});
  @override
  List<Object?> get props => [data];
}

class DataEntity extends Equatable{

  final int id;
  final String appointmentTime;
  final String appointmentEndTime;
  final DoctorEntity doctor;

  const DataEntity({required this.id, required this.appointmentTime, required this.appointmentEndTime,required this.doctor,});
  @override
  List<Object?> get props => [id, appointmentTime, appointmentEndTime ,doctor];

}

class DoctorEntity extends Equatable{

  final int id;
  final String nameDoctor;
  final String image;
  final String email;
  final SpecializationEntity specialization;

  const DoctorEntity({required this.id, required this.nameDoctor, required this.image, required this.email, required this.specialization});


  @override
  List<Object?> get props => [id, nameDoctor, image, email, specialization];
}

class SpecializationEntity extends Equatable{

  final String nameSpecialization;

  const SpecializationEntity({required this.nameSpecialization});

  @override
  List<Object?> get props => [nameSpecialization];
}