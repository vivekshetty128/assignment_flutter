import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_assignment/ui/root_view/root_viewmodel.dart';
import 'package:strive_assignment/ui/root_view/widgets/bottom_navbar_widget.dart';
import 'package:strive_assignment/ui/root_view/widgets/content_view.dart';
import 'package:strive_assignment/ui/root_view/widgets/dialog_view.dart';
import 'package:strive_assignment/ui/root_view/widgets/drawer_widget.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  bool isDrawerOpen = false;
  final _scafoldKey = GlobalKey<ScaffoldState>();
  static const List<String> itemList = [
    "View 1",
    "View 2",
    "View 3",
    "View 4",
    "View 5",
    "View 6",
    "View 7",
    "View 8",
    "View 9",
    "View 10"
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<RootViewModel>(builder: ((context, viewModel, child) {
      return WillPopScope(
          onWillPop: () async {
            if (_scafoldKey.currentState!.isDrawerOpen) return true;
            final result = viewModel.canExitApp();
            if (!result) return false;
            final canClose = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: ((context) => const ExitDialogWidget()));
            return canClose;
          },
          child: Scaffold(
            key: _scafoldKey,
            backgroundColor: Colors.transparent,
            drawer: const DrawerWidget(itemList: itemList),
            endDrawerEnableOpenDragGesture: false,
            bottomNavigationBar: const BottomNavBarWidget(),
            body: SafeArea(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  ContentView(
                    pageName: itemList[viewModel.currentIndex].toUpperCase(),
                  ),
                  InkWell(
                    onTap: () {
                      isDrawerOpen = true;
                      _scafoldKey.currentState?.openDrawer();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(Icons.menu_sharp, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ));
    }));
  }
}
