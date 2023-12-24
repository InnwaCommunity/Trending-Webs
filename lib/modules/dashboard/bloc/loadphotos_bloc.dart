import 'package:allinweb/models/dashboard/web_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';


part 'loadphotos_event.dart';
part 'loadphotos_state.dart';

class LoadphotosBloc extends Bloc<LoadphotosEvent, LoadphotosState> {
  LoadphotosBloc() : super(LoadphotosInitial()) {
    on<LoadphotosEvent>((event, emit) {
      
    });

    on<WebLogoPhoto> ((event,emit) async{
      final List<WebModel> webView=event.webModel;
      String logo='';
      for (var i = 0; i < webView.length; i++) {
        if (webView[i].url!.contains('.facebook.com')) {
        logo= 'assets/images/facebook_logo.jpg';
      } else if(webView[i].url!.contains('.youtube.com')){
        logo= 'assets/images/youtube_logo.png';
      }else if(webView[i].url!.contains('chat.openai.com')){
        logo= 'assets/images/ChatGPT_Logo.png';
      }else if(webView[i].url!.contains('pub.dev')){
        logo= 'assets/images/flutter_logo.png';
      }else{
        logo= 'assets/images/app_logo.jpg';
      }
      webView[i].image=logo;
      }
      emit(WebLogoLoaded(logo: logo));
    });
  }
}
