part of 'loadphotos_bloc.dart';

sealed class LoadphotosState extends Equatable {
  const LoadphotosState();
  
  @override
  List<Object> get props => [];
}

final class LoadphotosInitial extends LoadphotosState {}

class WebLogoLoaded extends LoadphotosState{
  final String logo;
  // final String userImage;
  const WebLogoLoaded({required this.logo});
  @override
  List<Object> get props => [logo];
}
