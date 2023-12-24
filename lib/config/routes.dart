
import 'package:allinweb/models/dashboard/web_model.dart';
import 'package:allinweb/modules/dashboard/bloc/loadphotos_bloc.dart';
import 'package:allinweb/modules/dashboard/web_view.dart';
import 'package:allinweb/main.dart';
import 'package:allinweb/modules/dashboard/you_tube_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/dashboard/web_view_loading/bloc/web_view_loading_bloc.dart';

class Routes{
  static const initalPage ='/';
  static const webView='webView';
  static const youTubeView='youTubeView';

  static Route<dynamic>? routeGenerator(RouteSettings settings){
    final argument =settings.arguments;
    switch (settings.name) {
      case '/':
        return makeRoute(
          MultiBlocProvider(
            providers: [
              // BlocProvider(
              //   create: (context) => SubjectBloc(),
              // ),
              BlocProvider(
                create: (context) => LoadphotosBloc(),
              ),
            ],
            child: const MyHomePage(),
          ),
          settings
        );
      case 'webView':
      return makeRoute(
        MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) => LoadphotosBloc(),
              ),
              BlocProvider(
                create: (context) => WebViewLoadingBloc(),
              ),
            ], 
            child: CommonWebView(webModel: argument as WebModel),),settings
        // BlocProvider(
        //   create: (context) => LoadphotosBloc(),
        //   child: CommonWebView(url: argument as String),
        // ),
        // settings
      );
      case 'youTubeView':
      return makeRoute(const YouTubeView(), settings);
    }

    return null;
  }
}

Route? makeRoute(Widget widget,RouteSettings settings){
    return MaterialPageRoute(
      builder: (context){
        return widget;
      },
      settings: settings
    );
  }