part of 'user_cubit.dart';

class UserDataState extends Equatable {
   final FormzStatus status;
  final UserModel model;
  const UserDataState({required this.model,this.status = FormzStatus.pure});


  UserDataState copyWith({FormzStatus? status,UserModel? model}) {
    return UserDataState(
      status: status ?? this.status,
      model:  model ?? this.model
    );
  }


  @override
  // ignore: always_specify_types
  List<Object?> get props => [status,model];

  
}


//UserModel model states
//upload event
//download event
//delete event
//store event
