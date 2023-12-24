part of 'loadphotos_bloc.dart';

sealed class LoadphotosEvent extends Equatable {
  const LoadphotosEvent();

  @override
  List<Object> get props => [];
}

class WebLogoPhoto extends LoadphotosEvent{
  final List<WebModel> webModel;
  const WebLogoPhoto({required this.webModel});
}
