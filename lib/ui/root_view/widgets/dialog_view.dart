import 'package:flutter/material.dart';
import 'package:strive_assignment/ui/shared/styles.dart';

class ExitDialogWidget extends StatelessWidget {
  const ExitDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async => false),
      child: Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Text(
                'EXIT',
                style: fontFamilyPoppinsMedium.size18.colorBlack,
              ),
              const SizedBox(height: 10),
              Center(
                  child: Text(
                'Are you sure,\n you want to exit?',
                style: fontFamilyPoppinsRegular.size18,
                textAlign: TextAlign.center,
              )),
              const SizedBox(height: 20),
              const Divider(color: Colors.black, height: 2),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context, false),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'CANCEL',
                          style:
                              fontFamilyPoppinsMedium.size14.primaryTextColor,
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context, true),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'OK',
                          style:
                              fontFamilyPoppinsRegular.size14.primaryTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
