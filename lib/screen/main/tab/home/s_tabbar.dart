import 'package:easyBible/common/common.dart';
import 'package:easyBible/screen/main/tab/home/w_chapter_selector_container.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  final int oldCount;
  final int newCount;
  const TabBarScreen(
      {super.key, required this.oldCount, required this.newCount});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelColor: Colors.black,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
          ),
          controller: tabController,
          onTap: (index) {},
          tabs: const [
            Tab(text: "구약"),
            Tab(text: "신약"),
          ],
        ).pOnly(bottom: 10),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              GridView.builder(
                itemCount: widget.oldCount,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemBuilder: (context, index) {
                  return ChapterSelector(text: "${index + 1}");
                },
              ),
              GridView.builder(
                itemCount: widget.newCount,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemBuilder: (context, index) {
                  return ChapterSelector(text: "${index + 1}");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
