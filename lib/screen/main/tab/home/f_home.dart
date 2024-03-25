import 'package:easyBible/common/common.dart';
import 'package:easyBible/common/widget/round_button_theme.dart';
import 'package:easyBible/common/widget/w_round_button.dart';
import 'package:easyBible/screen/dialog/d_message.dart';
import 'package:easyBible/screen/main/tab/home/d_category.dart';
import 'package:flutter/material.dart';

import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.seedColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => openDrawer(context),
                icon: const Icon(Icons.menu),
              )
            ],
          ),
          const EmptyExpanded(),
          RoundButton(
            text: 'Snackbar 보이기',
            onTap: () => showSnackbar(context),
            theme: RoundButtonTheme.blue,
          ),
          const Height(20),
          RoundButton(
            text: 'Confirm 다이얼로그',
            onTap: () => showConfirmDialog(context),
            theme: RoundButtonTheme.whiteWithBlueBorder,
          ),
          const Height(20),
          RoundButton(
            text: 'Message 다이얼로그',
            onTap: showMessageDialog,
            theme: RoundButtonTheme.whiteWithBlueBorder,
          ),
          const Height(20),
          RoundButton(
            text: '메뉴 보기',
            onTap: () => openDrawer(context),
            theme: RoundButtonTheme.blink,
          ),
          Tap(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: const DialogCategory(),
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              height: 45,
              padding: const EdgeInsets.only(left: 26),
              decoration: BoxDecoration(color: context.appColors.seedColor),
              child: Row(
                children: [
                  const Icon(Icons.note),
                  "나의 MBTI 기록보기"
                      .text
                      .size(16)
                      .color(context.appColors.seedColor)
                      .make()
                ],
              ),
            ),
          ),
          const EmptyExpanded()
        ],
      ),
    );
  }

  void showSnackbar(BuildContext context) {
    context.showSnackbar('snackbar 입니다.',
        extraButton: Tap(
          onTap: () {
            context.showErrorSnackbar('error');
          },
          child: '에러 보여주기 버튼'
              .text
              .white
              .size(13)
              .make()
              .centered()
              .pSymmetric(h: 10, v: 5),
        ));
  }

  Future<void> showConfirmDialog(BuildContext context) async {
    final confirmDialogResult = await ConfirmDialog(
      '오늘 기분이 좋나요?',
      buttonText: "네",
      cancelButtonText: "아니오",
    ).show();
    debugPrint(confirmDialogResult?.isSuccess.toString());

    confirmDialogResult?.runIfSuccess((data) {
      ColorBottomSheet(
        '❤️',
        context: context,
        backgroundColor: Colors.yellow.shade200,
      ).show();
    });

    confirmDialogResult?.runIfFailure((data) {
      ColorBottomSheet(
        '❤️힘내여',
        backgroundColor: context.appColors.seedColor,
        textColor: Colors.redAccent,
      ).show();
    });
  }

  Future<void> showMessageDialog() async {
    final result = await MessageDialog("안녕하세요").show();
    debugPrint(result.toString());
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
