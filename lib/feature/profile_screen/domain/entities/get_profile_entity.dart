import 'package:equatable/equatable.dart';

class GetProfileEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;

  const GetProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [id, name, email, phone];
}
