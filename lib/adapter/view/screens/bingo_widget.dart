import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../domain/salmonrun_data/common.dart';

class _Bingo {
  String? select;
  bool hit = false;

  _Bingo();
}

class BingoWidget extends StatefulWidget {
  const BingoWidget({Key? key}) : super(key: key);

  @override
  State<BingoWidget> createState() {
    return _BingoWidget();
  }
}

class _BingoWidget extends State<BingoWidget> {
  static const int _size = 5;
  bool isFixed = false;
  List<List<_Bingo>> weaponList = [];

  @override
  void initState() {
    super.initState();
    _clear();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double buttonWidth = screenSize.width * 0.4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bingo'),
        toolbarHeight: 45,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
            child: _createBingoCard(screenSize.width * 0.18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    isFixed = false;
                    setState(() {
                      _clear();
                    });
                  },
                  child: Text(L10n.of(context)!.bingoResetButton),
                ),
              ),
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    isFixed = true;
                    setState(() {
                      _createWeaponList();
                    });
                  },
                  child: Text(L10n.of(context)!.bingoStartButton),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool _isSelectedWeapon(String weapon) {
    for (int i = 0; i < _size; i++) {
      for (int j = 0; j < _size; j++) {
        if (weaponList[i][j].select == weapon) {
          return true;
        }
      }
    }
    return false;
  }

  AlertDialog _createSelectDialog(double size) {
    List<Widget> columnList = [];
    List<Widget> rowList = [];
    const int rowNum = 5;
    int count = 0;
    Common.weaponMap.forEach(
      (key, value) {
        rowList.add(SizedBox(
          width: size,
          height: size,
          child: SimpleDialogOption(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Image.asset(
              Common.getImageWeapon(key),
              color: _isSelectedWeapon(key) ? Colors.black : null,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(key);
            },
          ),
        ));
        count++;
        if (count >= rowNum) {
          columnList.add(Row(
            children: rowList,
          ));
          count = 0;
          rowList = [];
        }
      },
    );
    columnList.add(Row(
      children: rowList,
    ));

    return AlertDialog(
      insetPadding: const EdgeInsets.only(left: 10, right: 10),
      contentPadding: const EdgeInsets.only(left: 10, right: 10),
      scrollable: true,
      content: SingleChildScrollView(
        child: Column(
          children: columnList,
        ),
      ),
    );
  }

  Widget _createBingoCard(double boxSize) {
    List<Widget> col = [];

    for (int i = 0; i < _size; i++) {
      List<Widget> row = [];
      for (int j = 0; j < _size; j++) {
        Widget child;
        if (i == (_size / 2).floor() && j == (_size / 2).floor()) {
          child = Image.asset(Common.getKumasan());
        } else if (weaponList[i][j].select != null) {
          child = Image.asset(Common.getImageWeapon(weaponList[i][j].select!));
        } else {
          child = Center(
            child: Text(L10n.of(context)!.bingoTapHere,
                style: const TextStyle(color: Colors.grey)),
          );
        }

        row.add(
          InkWell(
            onTap: () {
              if (isFixed) {
                setState(() {
                  weaponList[i][j].hit = !weaponList[i][j].hit;
                });
              } else {
                showDialog<String>(
                  context: context,
                  builder: (_) {
                    return _createSelectDialog(boxSize * 0.8);
                  },
                ).then((weapon) {
                  if (weapon != null) {
                    _setWeapon(i, j, weapon);
                    setState(() {});
                  }
                });
              }
            },
            child: Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: weaponList[i][j].hit ? Colors.blue : Colors.black45),
              child: child,
            ),
          ),
        );
      }
      col.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: row,
      ));
    }
    return Column(
      children: col,
    );
  }

  void _clear() {
    weaponList = [];
    for (int i = 0; i < _size; i++) {
      List<_Bingo> tmp = [];
      for (int j = 0; j < _size; j++) {
        tmp.add(_Bingo());
      }
      weaponList.add(tmp);
    }
  }

  void _setWeapon(int i, int j, String weapon) {
    if (i != (_size / 2).floor() || j != (_size / 2).floor()) {
      if (weaponList[i][j].select == weapon) {
        weaponList[i][j].select = null;
      } else if (!_isSelectedWeapon(weapon)) {
        weaponList[i][j].select = weapon;
      }
    }
  }

  void _createWeaponList() {
    List<String> allWeaponList = [];
    Common.weaponMap.forEach(
      (key, value) {
        allWeaponList.add(key);
      },
    );
    var randomE = allWeaponList.toList()..shuffle();
    for (int i = 0; i < _size; i++) {
      for (int j = 0; j < _size; j++) {
        if (weaponList[i][j].select != null) {
          randomE.remove(weaponList[i][j].select);
        }
      }
    }

    for (int i = 0; i < _size; i++) {
      for (int j = 0; j < _size; j++) {
        if (weaponList[i][j].select == null) {
          weaponList[i][j].select = randomE[_size * i + j];
        }
      }
    }
  }
}
