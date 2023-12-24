import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'web_view_loading_event.dart';
part 'web_view_loading_state.dart';

class WebViewLoadingBloc extends Bloc<WebViewLoadingEvent, WebViewLoadingState> {
  WebViewLoadingBloc() : super(WebViewLoadingInitial()) {
    on<WebViewLoadingEvent>((event, emit) {});
    on<WebLoadingCall>((event, emit) {
      emit(StopLoading());
    },);
  }
}
