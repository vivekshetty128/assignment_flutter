import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_assignment/ui/root_view/root_viewmodel.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RootViewModel>(builder: ((context, viewModel, child) {
      return BottomNavigationBar(
          onTap: ((value) => viewModel.setBottombarIndex(value)),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: viewModel.bottomBarCurrentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profile',
            ),
          ]);
    }));
  }
}
