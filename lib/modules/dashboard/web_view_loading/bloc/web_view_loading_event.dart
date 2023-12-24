part of 'web_view_loading_bloc.dart';

sealed class WebViewLoadingEvent extends Equatable {
  const WebViewLoadingEvent();

  @override
  List<Object> get props => [];
}

class WebLoadingCall extends WebViewLoadingEvent{}
