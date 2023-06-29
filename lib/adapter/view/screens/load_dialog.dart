import 'dart:math';

import 'package:flutter/material.dart';

import '../../../adapter/view/common_view/empty_app_bar.dart';
import '../../../adapter/view/common_view/widget_util.dart';
import '../../../application/data_interactor.dart';
import '../../../domain/state/splatnet_state.dart';

class LoadDialog extends StatefulWidget {
  const LoadDialog({
    super.key,
    required this.dataInteractor,
    required this.isConnectAccount,
  });

  final DataInteractor? dataInteractor;
  final bool isConnectAccount;

  @override
  State<LoadDialog> createState() {
    return _LoadDialog();
  }
}

class _LoadDialog extends State<LoadDialog> {
  _LoadDialog() {
    _stateList = [];
    _apiList = [];
  }

  late final List<Widget> _stateList;
  late final List<String> _apiList;
  late final Widget _adWidget;
  late bool _isConnectAccount;
  final double _childBlockHeight = 25;
  final EdgeInsets e = const EdgeInsets.fromLTRB(0, 5, 0, 5);
  String _errMsg = '';

  @override
  void initState() {
    super.initState();
    _isConnectAccount = widget.isConnectAccount;
    _errMsg = '';
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _splatnetListener() {
    // SplatNetState state = widget.splatNet.getSplatNetState();
    // Log.i(
    //     '${state.type}, ${state.api}, ${state.status}, ${state.count} / ${state.max} (${state.msg})');

    // String beforeApi;
    // try {
    //   beforeApi = _apiList.last;
    // } catch (e) {
    //   beforeApi = '';
    // }

    // if (state.status == CommStatus.fail.toString()) {
    //   _errMsg = state.msg;
    // } else {
    //   _errMsg = '';
    // }
    // if (state.api != CommApi.empty.apiName) {
    //   int idx = _apiList.lastIndexOf(state.api);
    //   if (state.api == beforeApi && idx > -1) {
    //     setState(() {
    //       _stateList[idx] =
    //           Padding(padding: e, child: _createChildWidget(state, context));
    //     });
    //   } else {
    //     setState(() {
    //       _stateList.add(
    //           Padding(padding: e, child: _createChildWidget(state, context)));
    //     });
    //     _apiList.add(state.api);
    //   }
    // }

    // if (_isConnectAccount) {
    //   if (state.api == CommApi.bulletTokens.apiName &&
    //       state.status == CommStatus.success.toString()) {
    //     if (Navigator.canPop(context)) {
    //       Future.delayed(const Duration(seconds: 2)).then((value) {
    //         Navigator.of(context).pop();
    //       });
    //     }
    //   }
    // } else {
    //   if (state.api == CommApi.result.apiName &&
    //       state.status == CommStatus.success.toString()) {
    //     if (Navigator.canPop(context)) {
    //       Future.delayed(const Duration(seconds: 2)).then((value) {
    //         Navigator.of(context).pop();
    //       });
    //     }
    //   }
    // }
  }

  Widget _createTypeWidget(String type, double txtSize) {
    String str = type.toString();
    Color color;

    if (CommType.nso.toString() == type) {
      str = 'NSO';
      color = Colors.red;
    } else if (CommType.imink.toString() == type) {
      str = 'imink';
      color = Colors.pink;
    } else if (CommType.splatnet.toString() == type) {
      str = 'SplatNet';
      color = Colors.green;
    } else {
      return Container();
    }

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: WidgetUtil.createText(str, txtSize),
    );
  }

  Widget _createChildWidget(SplatNetState state, BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width * 0.8;
    Widget child;
    Widget widget;
    double txtSize = min(width * 0.04, 14);
    if (state.api == CommApi.result.apiName) {
      widget = WidgetUtil.createText("${state.count} / ${state.max}", txtSize);
    } else {
      if (CommStatus.start.toString() == state.status) {
        widget = SizedBox(
            width: _childBlockHeight,
            height: _childBlockHeight,
            child: const CircularProgressIndicator());
      } else if (CommStatus.success.toString() == state.status) {
        if (state.msg.isNotEmpty) {
          widget = Text(state.msg);
        } else {
          widget = const Icon(
            Icons.check_circle,
            color: Colors.green,
          );
        }
      } else if (CommStatus.fail.toString() == state.status) {
        widget = const Icon(
          Icons.cancel,
          color: Colors.red,
        );
      } else {
        widget = Container();
      }
    }

    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * 0.2,
          child: _createTypeWidget(state.type, txtSize),
        ),
        SizedBox(
          width: width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: WidgetUtil.createText(state.api, txtSize),
              ),
              widget,
            ],
          ),
        ),
      ],
    );

    return SizedBox(height: _childBlockHeight, child: child);
  }

  Widget _createErrMsgIfNeed() {
    if (_errMsg.isEmpty) {
      return Container();
    }

    final screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width * 0.8;
    final double txtSize = min(screenSize.width * 0.04, 14);

    return Center(
        child: Column(
      children: [
        WidgetUtil.createText(_errMsg, txtSize),
        ElevatedButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            }
          },
          child: WidgetUtil.createText('close', txtSize),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double horizentalPadding = screenSize.width * 0.1;

    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Column(
        children: [
          _adWidget,
          SizedBox(
            height: screenSize.height * 0.7,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: horizentalPadding,
                  right: horizentalPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _stateList,
                ),
              ),
            ),
          ),
          _createErrMsgIfNeed(),
        ],
      ),
    );
  }
}
