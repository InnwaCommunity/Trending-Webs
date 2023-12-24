part of 'web_view_loading_bloc.dart';

sealed class WebViewLoadingState extends Equatable {
  const WebViewLoadingState();
  
  @override
  List<Object> get props => [];
}

final class WebViewLoadingInitial extends WebViewLoadingState {}

class StopLoading extends WebViewLoadingState{}
