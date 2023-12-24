import 'package:allinweb/models/dashboard/web_model.dart';
import 'package:allinweb/modules/dashboard/web_view_loading/bloc/web_view_loading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:developer';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CommonWebView extends StatefulWidget {
  final WebModel webModel;
  const CommonWebView({super.key,required this.webModel});

  @override
  State<CommonWebView> createState() => _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {
  InAppWebViewController? webViewController;
  String imagename='';

  @override
  void initState() {
    widget.webModel.url!.toLowerCase().contains('facebook.com') ?
    imagename='assets/images/facebook_logo.jpg' : 
    widget.webModel.url!.toLowerCase().contains('youtube.com') ?
    imagename='assets/images/youtube_logo.png' : imagename='assets/images/app_logo.jpg.png' ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      appBar: AppBar(
        toolbarHeight: 10,
        automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      body: Stack(
        children: [
          Column(
        children: [
          BlocBuilder<WebViewLoadingBloc, WebViewLoadingState>(
            builder: (context, state) {
              if (state is StopLoading) {
                return Container();
              } else {
                return const LinearProgressIndicator();
              }
            },
          ),
          Expanded(
              flex: 5,
              child: InAppWebView(
                contextMenu: ContextMenu(
                  options: ContextMenuOptions(
                    hideDefaultSystemContextMenuItems: true
                  )
                ),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    transparentBackground: true
                  )
                ),
                // windowId: 1,
                initialUrlRequest: URLRequest(url: Uri.parse(widget.webModel.url!)),
                onLoadStop: (controller, url) {
                  BlocProvider.of<WebViewLoadingBloc>(context)
                      .add(WebLoadingCall());
                },
                onWebViewCreated: (controller) => webViewController=controller,
                onUpdateVisitedHistory: (controller, url, androidIsReload) {
                  // webViewController!.loadData(data: url.toString());
                  log('$url');
                },
                onDownloadStartRequest: (controller, downloadStartRequest) {
                  
                },
                // shouldOverrideUrlLoading: (controller, navigationAction) {
                //   webViewController!.loadData(data: data)
                // },
              ),
            )
          
        ],
      )
        ],
      ),
    //   bottomSheet:ButtonBar(
    //         alignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           ElevatedButton(
    //             child: const Icon(Icons.arrow_back),
    //             onPressed: () {
    //               webViewController?.goBack();
    //             },
    //           ),
    //           ElevatedButton(
    //             child:const Icon(Icons.refresh),
    //             onPressed: () {
    //               webViewController?.reload();
    //             },
    //           ),
    //           ElevatedButton(
    //             child: const Icon(Icons.arrow_forward),
    //             onPressed: () {
    //               webViewController?.goForward();
    //             },
    //           ),
    //         ],
    //       ),
          floatingActionButton: SpeedDial(
          
          closeManually: true,
          spaceBetweenChildren: 30,
          // tooltip: AutofillHints.gender,
          direction: SpeedDialDirection.left,
          buttonSize: const Size(45, 45),
          childrenButtonSize: const Size(45, 45),
          overlayOpacity: 0.0,
          gradientBoxShape: BoxShape.circle,
          icon: Icons.add,
          activeIcon: Icons.close,
          elevation: 6,
          children: [
            SpeedDialChild(
                onTap: () {
                  webViewController?.goForward();
                },
                labelBackgroundColor: Colors.transparent,
                labelShadow: const [
                  BoxShadow(color: Colors.transparent),
                ],
                child: const Icon(Icons.settings)),
            SpeedDialChild(
                onTap: () {
                  webViewController?.goForward();
                },
                labelBackgroundColor: Colors.transparent,
                labelShadow: const [
                  BoxShadow(color: Colors.transparent),
                ],
                child: const Icon(Icons.arrow_forward)),
            SpeedDialChild(
                onTap: () {
                  webViewController?.reload();
                },
                labelBackgroundColor: Colors.transparent,
                labelShadow: const [
                  BoxShadow(color: Colors.transparent),
                ],
                child: const Icon(Icons.refresh)),
            SpeedDialChild(
                onTap: () {
                  webViewController?.goBack();
                },
                labelBackgroundColor: Colors.transparent,
                labelShadow: const [
                  BoxShadow(color: Colors.transparent),
                ],
                child: const Icon(Icons.arrow_back)),
          ],
        )
      // child: MaterialButton(
      //                               height: 50,
      //               minWidth: 45,
      //               clipBehavior: Clip.hardEdge,
      //                               shape: RoundedRectangleBorder(
      //                                   borderRadius: BorderRadius.circular(30),
      //                                   side: const BorderSide(
      //                                       color: Colors.white)),
      //                               // onPressed: skipAction,
      //                               onPressed: (){},
      //                               child: const Text(
      //                                 'Skip',
      //                                 style: TextStyle(
      //                                     fontSize: 15, color: Colors.white),
      //                               )),
    );
  }
}