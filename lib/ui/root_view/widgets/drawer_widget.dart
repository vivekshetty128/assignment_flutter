import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_assignment/ui/root_view/root_viewmodel.dart';
import 'package:strive_assignment/ui/shared/styles.dart';

class DrawerWidget extends StatelessWidget {
  final List<String> itemList;
  const DrawerWidget({
    Key? key,
    required this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RootViewModel>(
      builder: (BuildContext context, RootViewModel viewModel, Widget? child) {
        return Drawer(
            width: MediaQuery.of(context).size.width * 0.50,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: SizedBox(
                    height: 100,
                    child: Icon(
                      Icons.photo,
                      size: 50,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: itemList.length,
                      itemBuilder: ((context, index) => InkWell(
                            onTap: (() => viewModel.onTap(index)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    itemList[index],
                                    style: fontFamilyPoppinsMedium.size13,
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ))),
                ),
              ],
            ));
      },
    );
  }
}
