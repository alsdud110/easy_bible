import 'package:easyBible/common/common.dart';
import 'package:easyBible/common/widget/w_round_button.dart';
import 'package:easyBible/screen/main/tab/home/s_tabbar.dart';
import 'package:easyBible/screen/main/tab/home/w_chapter_selector_container.dart';
import 'package:flutter/material.dart';

class DialogCategory extends StatefulWidget {
  const DialogCategory({super.key});

  @override
  State<DialogCategory> createState() => _DialogCategoryState();
}

class _DialogCategoryState extends State<DialogCategory> {
  final int count_60_old = 48;
  final int count_60_new = 12;
  final int count_120_old = 94;
  final int count_120_new = 26;
  final int count_180_old = 120;
  final int count_180_new = 60;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              height: 30,
              bgColor: selectedIndex == 0
                  ? context.appColors.activeButtonColor
                  : context.appColors.buttonColor,
              text: "60 Days",
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            RoundButton(
              height: 30,
              bgColor: selectedIndex == 1
                  ? context.appColors.activeButtonColor
                  : context.appColors.buttonColor,
              text: "120 Days",
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            RoundButton(
              height: 30,
              bgColor: selectedIndex == 2
                  ? context.appColors.activeButtonColor
                  : context.appColors.buttonColor,
              text: "180 Days",
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
          ],
        ).pSymmetric(v: 20),
        if (selectedIndex == 0)
          Expanded(
              child:
                  TabBarScreen(oldCount: count_60_old, newCount: count_60_new)),
        if (selectedIndex == 1)
          Expanded(
              child: TabBarScreen(
                  oldCount: count_120_old, newCount: count_120_new)),
        if (selectedIndex == 2)
          Expanded(
              child: TabBarScreen(
                  oldCount: count_180_old, newCount: count_180_new)),
      ],
    );
  }
}
