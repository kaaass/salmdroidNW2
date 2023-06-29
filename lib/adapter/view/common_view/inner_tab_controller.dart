import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class InnerTabController extends StatefulWidget {
  final int initailIndex;
  final List<Widget> tabs;
  final List<Widget> bodys;
  final int tebSpaceFlex; // タブを左寄せする場合の割合幅
  final int freeSpaceFlex; // タブを左寄せする場合の右側の割合幅
  final Function(int)? callback;
  const InnerTabController({
    Key? key,
    required this.initailIndex,
    required this.tabs,
    required this.bodys,
    this.tebSpaceFlex = 1,
    this.freeSpaceFlex = 0,
    this.callback,
  }) : super(key: key);

  @override
  InnerTabControllerState createState() => InnerTabControllerState();
}

class InnerTabControllerState extends State<InnerTabController>
    with SingleTickerProviderStateMixin {
  List<GlobalKey> keys = [];
  List<double?> bodyHeights = [];
  late TabController tabController;
  int initialIdx = 0;
  @override
  void initState() {
    initialIdx = widget.initailIndex;
    tabController = TabController(
        vsync: this,
        length: widget.tabs.length,
        initialIndex: widget.initailIndex);

    tabController.addListener(() {
      if (widget.callback != null) {
        widget.callback!(tabController.index);
      }
    });
    for (int i = 0; i < widget.tabs.length; i++) {
      bodyHeights.add(null);
      keys.add(GlobalKey());
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        for (int i = 0; i < widget.tabs.length; i++) {
          if (keys[i].currentContext?.size != null) {
            bodyHeights[i] = keys[i].currentContext!.size!.height + 5;
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tabs.length != widget.bodys.length) {
      throw Exception('tabsとbodysとbodySizesの配列の数を同じにして下さい。');
    }
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: widget.tebSpaceFlex,
              child: TabBar(
                controller: tabController,
                tabs: widget.tabs,
                unselectedLabelColor: Colors.grey,
                indicator: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
//                indicatorColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Flexible(
              flex: widget.freeSpaceFlex,
              child: const SizedBox(),
            ),
          ],
        ),
        const Divider(height: 0),
        if (bodyHeights[tabController.index] == null)
          Container(
            key: keys[tabController.index],
            alignment: Alignment.centerLeft,
            child: widget.bodys[tabController.index],
          )
        else
          SizedBox(
            height: bodyHeights[tabController.index],
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: widget.bodys,
            ),
          ),
      ],
    );
  }
}
