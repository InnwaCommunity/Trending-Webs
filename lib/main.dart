
import 'dart:io';

import 'package:allinweb/commons/widget/dismiss_keyboard.dart';
import 'package:allinweb/config/context_ext.dart';
import 'package:allinweb/config/routes.dart';
import 'package:allinweb/models/dashboard/web_model.dart';
import 'package:allinweb/modules/dashboard/bloc/loadphotos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: 'Main Navigator');
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tranding Web',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: navigatorKey,
        onGenerateRoute: Routes.routeGenerator,
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Material materialButton;
//   late int index;
//   final onboardingPagesList = [
//     PageModel(
//       widget: DecoratedBox(
//         decoration: BoxDecoration(
//           color: background,
//           border: Border.all(
//             width: 0.0,
//             color: background,
//           ),
//         ),
//         child: SingleChildScrollView(
//           controller: ScrollController(),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 45.0,
//                   vertical: 90.0,
//                 ),
//                 child: Image.asset('assets/images/facebook_logo.jpg',
//                     color: pageImageColor),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'SECURED BACKUP',
//                     style: pageTitleStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
//                     style: pageInfoStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
//                     style: pageInfoStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
//                     style: pageInfoStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
//                     style: pageInfoStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     PageModel(
//       widget: DecoratedBox(
//         decoration: BoxDecoration(
//           color: background,
//           border: Border.all(
//             width: 0.0,
//             color: background,
//           ),
//         ),
//         child: SingleChildScrollView(
//           controller: ScrollController(),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 45.0,
//                   vertical: 90.0,
//                 ),
//                 child: Image.asset('assets/images/google_logo.png',
//                     color: pageImageColor),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'CHANGE AND RISE',
//                     style: pageTitleStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Give others access to any file or folders you choose',
//                     style: pageInfoStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     PageModel(
//       widget: DecoratedBox(
//         decoration: BoxDecoration(
//           color: background,
//           border: Border.all(
//             width: 0.0,
//             color: background,
//           ),
//         ),
//         child: SingleChildScrollView(
//           controller: ScrollController(),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 45.0,
//                   vertical: 90.0,
//                 ),
//                 child: Image.asset('assets/images/youtube_logo.png',
//                     color: pageImageColor),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'EASY ACCESS',
//                     style: pageTitleStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Reach your files anytime from any devices anywhere',
//                     style: pageInfoStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     materialButton = _skipButton();
//     index = 0;
//   }

//   Material _skipButton({void Function(int)? setIndex}) {
//     return Material(
//       borderRadius: defaultSkipButtonBorderRadius,
//       color: defaultSkipButtonColor,
//       child: InkWell(
//         borderRadius: defaultSkipButtonBorderRadius,
//         onTap: () {
//           if (setIndex != null) {
//             index = 2;
//             setIndex(2);
//           }
//         },
//         child: const Padding(
//           padding: defaultSkipButtonPadding,
//           child: Text(
//             'Skip',
//             style: defaultSkipButtonTextStyle,
//           ),
//         ),
//       ),
//     );
//   }

//   Material get _signupButton {
//     return Material(
//       borderRadius: defaultProceedButtonBorderRadius,
//       color: defaultProceedButtonColor,
//       child: InkWell(
//         borderRadius: defaultProceedButtonBorderRadius,
//         onTap: () {

//         },
//         child: const Padding(
//           padding: defaultProceedButtonPadding,
//           child: Text(
//             'Sign up',
//             style: defaultProceedButtonTextStyle,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//         body: Onboarding(
//           pages: onboardingPagesList,
//           onPageChange: (int pageIndex) {
//             index = pageIndex;
//           },
//           startPageIndex: 0,
//           footerBuilder: (context, dragDistance, pagesLength, setIndex) {
//             return DecoratedBox(
//               decoration: BoxDecoration(
//                 color: background,
//                 border: Border.all(
//                   width: 0.0,
//                   color: background,
//                 ),
//               ),
//               child: ColoredBox(
//                 color: background,
//                 child: Padding(
//                   padding: const EdgeInsets.all(45.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustomIndicator(
//                         netDragPercent: dragDistance,
//                         pagesLength: pagesLength,
//                         indicator: Indicator(
//                           indicatorDesign: IndicatorDesign.line(
//                             lineDesign: LineDesign(
//                               lineType: DesignType.line_uniform,
//                             ),
//                           ),
//                         ),
//                       ),
//                       index == pagesLength - 1
//                           ? _signupButton
//                           : _skipButton(setIndex: setIndex)
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchUrl = TextEditingController();
  final offerPagesController =
      PageController(viewportFraction: 0.93, keepPage: true, initialPage: 1);
  final reviewPagesController =
      PageController(viewportFraction: 0.93, keepPage: true, initialPage: 1);
  WebModel thethsumyat=WebModel(1, 'image', 'https://www.facebook.com/');
  WebModel jdcclass=WebModel(1, 'image', 'https://m.youtube.com/watch?v=4LqOJhVaFUE');
  WebModel eimaung=WebModel(1, 'image', 'https://eimaung.com/?fbclid=IwAR3qMjmigeGRdxLzXMMJq4UYs67pS3ybhUcC3vfp01fIlqBJSce7tX3dQVY');
  WebModel test=WebModel(1, 'image', 'https://www.youtube.com/channel/UC-9-kyTW8ZkZNDHQJ6FgpwQ');
  WebModel equatable=WebModel(1, 'image', 'https://pub.dev/packages/equatable');
  WebModel urlLauncher=WebModel(1, 'image', 'https://pub.dev/packages/url_launcher');
  WebModel flutterDownloader=WebModel(1, 'image', 'https://pub.dev/packages/flutter_downloader');
  WebModel pathProvider=WebModel(1, 'image', 'https://pub.dev/packages/path_provider');
  WebModel permissionHandler=WebModel(1, 'image', 'https://pub.dev/packages/permission_handler');
  WebModel tiktok=WebModel(1, 'image', 'https://www.tiktok.com/foryou');
  List<WebModel> webmodel=[];
  WebModel googleSearch=WebModel(1,'image','https://www.google.com/');
  @override
  void initState() {
    webmodel = [
      thethsumyat,
      urlLauncher,
      eimaung,
      test,
      equatable,
      jdcclass,
      flutterDownloader,
      pathProvider,
      permissionHandler,
      tiktok
    ];
    super.initState();
  }

  void callImage(List<WebModel> webModel) {
    BlocProvider.of<LoadphotosBloc>(context).add( WebLogoPhoto(webModel: webModel));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Form(
              child: TextFormField(
                controller: searchUrl,
                    keyboardType: TextInputType.name,
                    style:const TextStyle(fontSize: 17),
                    decoration:const InputDecoration(
                      // suffixIcon: Icon(Icons.search, size: 20,),
                      hintText: "Search for services",
                    ),
                  )),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 30, 5),
                child: GestureDetector(
                  onTap: (){
                    context.toName(Routes.webView,
                                      arguments: googleSearch);
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/images/google_search_icon.png',
                      gaplessPlayback: true,
                      fit: BoxFit.cover,
                      height: 45,
                    ),
                  ),
                ),
              ),
          ]
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 170,
                child: PageView.builder(
                    controller: offerPagesController,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 10,
                              width: 10,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 100,
                child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                        10,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                                onTap: () async {
                                  context.toName(Routes.webView,
                                      arguments: webmodel[index]);
                                },
                                child: BlocBuilder<LoadphotosBloc, LoadphotosState>(
                                  builder: (context, state) {
                                    if (state is LoadphotosInitial) {
                                      callImage(webmodel);
                                      return Container(
                                        height: 45,
                                        width: 45,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey),
                                            child: const Center(
                                              child:  CircularProgressIndicator(),
                                            ),
                                      );
                                    }else if (state is WebLogoLoaded) {
                                      return Container(
                    height: 45,
                    width: 45,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      webmodel[index].image!,
                      gaplessPlayback: true,
                      // fit: BoxFit.cover,
                      height: 45,
                    ),
                  );
                                    } else {
                                      return Container(
                                        height: 45,
                                        width: 45,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey),
                                            child: const Center(
                                              child:  CircularProgressIndicator(),
                                            ),
                                      );
                                    }
                                  },
                                ),
                              ),
                        ))),
              ),
              SizedBox(
                height: 100,
                child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                        10,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                                onTap: () async {
                                  context.toName(Routes.webView,
                                      arguments: webmodel[index]);
                                },
                                child: BlocBuilder<LoadphotosBloc, LoadphotosState>(
                                  builder: (context, state) {
                                    if (state is LoadphotosInitial) {
                                    callImage(webmodel);
                                      return Container(
                                        height: 45,
                                        width: 45,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey),
                                            child: const Center(
                                              child:  CircularProgressIndicator(),
                                            ),
                                      );
                                    }else if (state is WebLogoLoaded) {
                                     return Container(  
                                        height: 45,
                                        width: 45,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          webmodel[index].image!,
                                          gaplessPlayback: true,
                                          // fit: BoxFit.cover,
                                          height: 45,
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        height: 45,
                                        width: 45,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey),
                                            child: const Center(
                                              child:  CircularProgressIndicator(),
                                            ),
                                      );
                                    }
                                  },
                                ),
                              ),
                        ))),
              ),
            ],
          ),
        )
        // Column(
        //   children: [
        //     GridView.count(
        //       scrollDirection: Axis.vertical,
        //       crossAxisCount: 4,
        //       children: const [
        //         CircleAvatar(
        //           child: Text('FaceBook'),
        //         ),
        //         CircleAvatar(
        //           child: Text('Google'),
        //         ),
        //         CircleAvatar(
        //           child: Text('Telegram'),
        //         ),
        //         CircleAvatar(
        //           child: Text('Instegram'),
        //         ),
        //         CircleAvatar(
        //           child: Text('FaceBook'),
        //         ),
        //         CircleAvatar(
        //           child: Text('FaceBook'),
        //         ),
        //         CircleAvatar(
        //           child: Text('FaceBook'),
        //         ),
        //         CircleAvatar(
        //           child: Text('FaceBook'),
        //         ),
        //       ],)
        //   ],
        // )
        // Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        //       child: TextFormField(
        //         controller: searchUrl,
        //         decoration: InputDecoration(
        //           labelText: "Enter Search Url",
        //           enabledBorder: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(10.0),
        //           ),
        //         ),
        //         validator: (value) {
        //           if (value!.isEmpty) {
        //             return 'Enter User Name';
        //           }
        //           return null;
        //         },
        //       ),
        //     ),

        //   ],
        // ),
        );
  }
}
