import '../../domain/entities/my_appointment_entity.dart';

class MyAppointmentModel extends MyAppointmentEntity {
  const MyAppointmentModel({required super.data});

  factory MyAppointmentModel.fromJson(Map<String, dynamic> json) {
    return MyAppointmentModel(
      data: (json['data'] as List).map((e) => DataModel.fromJson(e)).toList(),
    );
  }
}

class DataModel extends DataEntity {
  const DataModel({
    required super.doctor,
    required super.id,
    required super.appointmentTime,
    required super.appointmentEndTime,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      doctor: DoctorModel.fromJson(json['doctor']),
      id: json['id'],
      appointmentTime: json['appointment_time'],
      appointmentEndTime: json['appointment_end_time'],
    );
  }
}

class DoctorModel extends DoctorEntity {
  const DoctorModel({
    required super.image,
    required super.specialization,
    required super.id,
    required super.nameDoctor,
    required super.email,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      image: json['photo'],
      specialization: SpecializationModel.fromJson(json['specialization']),
      id: json['id'],
      nameDoctor: json['name'],
      email: json['email'],
    );
  }
}

class SpecializationModel extends SpecializationEntity {
  const SpecializationModel({required super.nameSpecialization});

  factory SpecializationModel.fromJson(Map<String, dynamic> json) {
    return SpecializationModel(nameSpecialization: json['name']);
  }
}
