import 'package:flutter/material.dart';
import 'package:strive_assignment/ui/shared/styles.dart';

class ContentView extends StatelessWidget {
  final String pageName;
  const ContentView({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Center(
          child: Text(
        pageName.toUpperCase(),
        style: fontFamilyPoppinsMedium.size15,
      )),
    );
  }
}
