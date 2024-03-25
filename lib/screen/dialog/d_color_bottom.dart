import 'package:easyBible/common/widget/w_round_button.dart';
import 'package:easyBible/data/simple_result.dart';
import 'package:flutter/material.dart';
import 'package:nav/bottom_sheet/modal_bottom_sheet.dart';

import '../../common/common.dart';

class ColorBottomSheet extends ModalBottomSheet<SimpleResult> {
  final String message;
  final Color textColor;

  int selectedIndex = 0;

  void updateIdex(int index) {
    selectedIndex = index;
  }

  final int rowCount_60 = 5;
  final int colCount_60 = 12;
  final int rowCount_120 = 8;
  final int colCount_120 = 15;
  final int rowCount_180 = 10;
  final int colCount_180 = 18;

  ColorBottomSheet(
    this.message, {
    Color? textColor,
    super.context,
    super.key,
    super.backgroundColor = Colors.purple,
    super.handleColor = Colors.red,
    super.barrierColor = const Color(0x80000000),
  }) : textColor = textColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () => hide(SimpleResult()),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundButton(
                  height: 30,
                  bgColor: context.appColors.activeButtonColor,
                  text: "60 Days",
                  onTap: () {
                    updateIdex(0);
                  },
                ),
                RoundButton(
                  height: 30,
                  bgColor: context.appColors.buttonColor,
                  text: "120 Days",
                  onTap: () {
                    updateIdex(1);
                  },
                ),
                RoundButton(
                  height: 30,
                  bgColor: context.appColors.buttonColor,
                  text: "180 Days",
                  onTap: () {
                    updateIdex(2);
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (selectedIndex == 0) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        itemCount: rowCount_60 * colCount_60,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: rowCount_60,
                        ),
                        itemBuilder: (context, index) {
                          return Center(
                            child: Text("$index"),
                          );
                        },
                      ),
                    );
                  } else if (selectedIndex == 1) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        itemCount: rowCount_120 * colCount_120,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: rowCount_120,
                        ),
                        itemBuilder: (context, index) {
                          return Center(
                            child: Text("$index"),
                          );
                        },
                      ),
                    );
                  } else if (selectedIndex == 2) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        itemCount: rowCount_180 * colCount_180,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: rowCount_180,
                        ),
                        itemBuilder: (context, index) {
                          return Center(
                            child: Text("$index"),
                          );
                        },
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
