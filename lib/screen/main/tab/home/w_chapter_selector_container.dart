import 'package:easyBible/common/common.dart';
import 'package:flutter/material.dart';

class ChapterSelector extends StatelessWidget {
  final String text;
  const ChapterSelector({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.appColors.activeButtonColor),
      child: "Day \n$text".text.center.make(),
    );
  }
}
