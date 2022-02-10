import 'package:equatable/equatable.dart';

class LocalUser extends Equatable
{
  final String? email;
  final String? name;
  final String? photo;
  final String id;

  const LocalUser({required this.id, this.email,this.name,this.photo});

  static const empty = LocalUser(id: '');

  bool get isEmpty => this == LocalUser.empty;

  bool get isNotEmpty => this != LocalUser.empty;

  @override
  List<Object?> get props => [email,name,photo,id];

}