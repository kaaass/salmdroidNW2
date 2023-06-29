class NewsContent {
  static Section ja = Section(
    newFunc: [
      Item(
        main: 'シフト一覧画面の更新',
        sub: [
          '表示する情報を追加しました。「予測されたオカシラシャケ」はあくまで予測です。',
          '表示するシフトをフィルタリングできるようにしました。',
        ],
      ),
    ],
    bugFix: [],
  );
  static Section en = Section(
    newFunc: [
      Item(
        main: 'Update information of Rotatins List',
        sub: [
          'Add information. Estimated King Salmonids is just only estimated.',
          'You can select filter to show rotatins.'
        ],
      ),
    ],
    bugFix: [],
  );
  // 簡体字
  static Section zh = Section(
    newFunc: [
      Item(
        main: '日程一览更新',
        sub: ['要显示的其他信息。' '预测的头目鲑鱼只是一个预测。', '可以对要显示的班次进行过滤。'],
      ),
    ],
    bugFix: [],
  );
  // 繁体字
  static Section zhtw = Section(
    newFunc: [
      Item(
        main: '日程一覽更新',
        sub: ['要顯示的其他信息。' '預測的頭目鮭魚只是一個預測。', '可以對要顯示的班次進行過濾。'],
      ),
    ],
    bugFix: [],
  );
}

class Section {
  List<Item> newFunc;
  List<Item> bugFix;

  Section({required this.newFunc, required this.bugFix});
}

class Item {
  String main;
  List<String> sub;

  Item({required this.main, required this.sub});
}
