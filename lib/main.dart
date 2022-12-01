import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:strive_assignment/ui/root_view/root_view.dart';
import 'package:strive_assignment/ui/root_view/root_viewmodel.dart';
import 'package:strive_assignment/ui/shared/app_theme.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => RootViewModel()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        home: const RootView(),
      ),
    );
  }
}
