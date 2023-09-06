import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../adapter/view/common_view/empty_app_bar.dart';
import '../../../adapter/view/common_view/widget_util.dart';
import '../../../adapter/view/screens/bingo_widget.dart';
import '../../../adapter/view/screens/news_dialog.dart';
import '../../../application/app_data_instractor.dart';
import '../../../application/backup_interactor.dart';
import '../../../application/data_interactor.dart';
import '../../../domain/app_data/language.dart';
import '../../../domain/state/data_state.dart';
import '../../../util/log.dart';
import 'dialog_widget.dart';

class Setting extends StatefulWidget {
  const Setting({
    super.key,
    required this.appDataInteractor,
    required this.dataInteractor,
    required this.backupInteractor,
  });

  final AppDataInteractor appDataInteractor;
  final DataInteractor dataInteractor;
  final BackupInteractor backupInteractor;

  @override
  State<Setting> createState() {
    return _Setting();
  }
}

class _Setting extends State<Setting> {
  String? _appName;
  final bool _isCalcShift = false;
  DataState? _state;
  BuildContext? _innerContext;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _update() {
    Log.i('setting#update()');
    setState(() {});
  }

  Future<void> _load() async {
    String? ret = widget.appDataInteractor.getAppName();
    while (ret == null) {
      await Future.delayed(const Duration(seconds: 1));
      ret = widget.appDataInteractor.getAppName();
    }
    setState(() {
      _appName = ret;
    });
  }

  String getLanguage(Language lang) {
    switch (lang) {
      case Language.japanese:
        return '日本語';
      case Language.english:
        return 'English';
      default:
        return '';
    }
  }

  void _showProgressDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 300),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          _innerContext = context;
          return _state == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [Text('${_state!.now} / ${_state!.max}')],
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    Log.i('build setting');
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('Data'),
              tiles: <SettingsTile>[
                _createTileRestore(),
                _createTileCalcData(),
              ],
            ),
            SettingsSection(
              title: const Text('Util'),
              tiles: <SettingsTile>[
                _createTileBingo(),
                if (_isTestApp()) _createTileIsAd(),
              ],
            ),
            if (_isTestApp())
              SettingsSection(
                title: const Text('Salmon Stats'),
                tiles: <SettingsTile>[
                  _createTileIsUploadToSalmonStats(),
                ],
              ),
            SettingsSection(
              title: const Text('App'),
              tiles: <SettingsTile>[
                _createTileLanguage(),
                _createTileNews(),
                _createTileAppVersion(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _isTestApp() {
    return (_appName != null ? _appName!.indexOf('test') > 0 : false);
  }

  Future<String> _getAppBuildVersion() async {
    String? ret = widget.appDataInteractor.getAppBuildVersion();
    while (ret == null) {
      await Future.delayed(const Duration(seconds: 1));
      ret = widget.appDataInteractor.getAppBuildVersion();
    }
    return Future.value(ret);
  }

  String _convertDisplayLanguage(Language lang) {
    switch (lang) {
      case Language.japanese:
        return '日本語';
      case Language.english:
        return 'English';
      case Language.zh:
        return '简体字';
      case Language.zhtw:
        return '繁体字';
      default:
        return '';
    }
  }

  SettingsTile _createTileLanguage() {
    return SettingsTile.navigation(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.language),
        ],
      ),
      title: const Text('Language'),
      description:
          Text(_convertDisplayLanguage(widget.appDataInteractor.getLanguage())),
      onPressed: (context) {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text("Language"),
              children: <Widget>[
                _createLanguageTile(context, Language.japanese),
                _createLanguageTile(context, Language.english),
                _createLanguageTile(context, Language.zh),
                _createLanguageTile(context, Language.zhtw),
              ],
            );
          },
        );
      },
    );
  }

  Widget _createLanguageTile(BuildContext context, Language lang) {
    return SimpleDialogOption(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      onPressed: () {
        widget.appDataInteractor.saveLanguage(lang);
        Navigator.pop(context);
      },
      child: WidgetUtil.createText(_convertDisplayLanguage(lang), 14),
    );
  }

  SettingsTile _createTileRestore() {
    return SettingsTile.navigation(
      leading: const Icon(Icons.unarchive),
      title: Text(L10n.of(context)!.restore),
      onPressed: (context) {
        readBackupFile(context);
      },
    );
  }

  SettingsTile _createTileCalcData() {
    return SettingsTile.navigation(
      leading: const Icon(Icons.fact_check),
      title: Text(L10n.of(context)!.calcData),
      onPressed: (_) {
        _state = null;
        _showProgressDialog();
        widget.dataInteractor.calcForShiftData().then((value) {
          return Future.delayed(const Duration(seconds: 2));
        }).then((value) {
          widget.dataInteractor.requestUpdate();
          if (_innerContext != null) {
            Navigator.of(_innerContext!).pop();
          }
        });
      },
    );
  }

  SettingsTile _createTileIsUploadToSalmonStats() {
    return SettingsTile.switchTile(
      leading: const Icon(Icons.upload),
      title: Text(L10n.of(context)!.uploadToSalmonStats),
      initialValue: widget.appDataInteractor.getIsUploadToSalmonStats(),
      onToggle: (value) {
        widget.appDataInteractor.saveUploadStats(value);
        setState(() {});
      },
    );
  }

  SettingsTile _createTileBingo() {
    return SettingsTile.navigation(
      leading: const Icon(Icons.grid_on),
      title: Text(L10n.of(context)!.bingo),
      onPressed: (context) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const BingoWidget(),
          ),
        );
      },
    );
  }

  SettingsTile _createTileIsAd() {
    return SettingsTile.switchTile(
      leading: const Icon(Icons.stars),
      title: Text(L10n.of(context)!.ad),
      initialValue: widget.appDataInteractor.getIsAd(),
      onToggle: (value) {
        widget.appDataInteractor.saveAd(value);
        setState(() {});
      },
    );
  }

  SettingsTile _createTileNews() {
    return SettingsTile.navigation(
      leading: const Icon(Icons.new_releases),
      title: Text(L10n.of(context)!.news),
      onPressed: (context) {
        showDialog(
          context: context,
          builder: (context) {
            return NewsDialog(
              language: widget.appDataInteractor.getLanguage(),
              version: widget.appDataInteractor.getConvertedBuildVersion(),
            );
          },
        );
      },
    );
  }

  SettingsTile _createTileAppVersion() {
    return SettingsTile.navigation(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.info),
        ],
      ),
      title: Text(_appName ?? ''),
      description: FutureBuilder(
        future: _getAppBuildVersion(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(widget.appDataInteractor.getConvertedBuildVersion());
          } else {
            return const Text('');
          }
        },
      ),
    );
  }

  Future<void> readBackupFile(BuildContext inContext) async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'images',
      extensions: <String>['*'],
    );
    final XFile? file =
        await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);

    if (file == null) {
      // canceled
      return;
    }

    Log.d('${file.path} + ${file.name}');
    bool isZip = file.name.split('.').last == 'zip';
    widget.backupInteractor.resetState();
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) =>
              DialogWidget(backupInteractor: widget.backupInteractor)),
    );
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      return file.readAsBytes();
    }).then((readData) {
      if (isZip) {
        return widget.backupInteractor.restoreV2(readData);
      } else {
        return widget.backupInteractor.restore(readData);
      }
    }).then((restoreResult) {
      Log.i('canpop');
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
      if (restoreResult) {
        widget.appDataInteractor.requestUpdate();
      } else {
        Log.i('restore fail');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Restore Error"),
              content: Text(L10n.of(context)!.restoreError),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    });

    // PermissionHandler.requestPermission().then((value) {
    //   if (value) {
    //     const params = OpenFileDialogParams(
    //       dialogType: OpenFileDialogType.document,
    //       sourceType: SourceType.photoLibrary,
    //     );
    //     bool isZip;
    //     File file;
    //     FlutterFileDialog.pickFile(params: params).then((filepath) {
    //       if (filepath != null) {
    //         file = File(filepath);

    //         isZip = filepath.split('.').last == 'zip';
    //         widget.backupInteractor.resetState();
    //         Navigator.of(context).push(
    //           MaterialPageRoute(
    //               builder: (context) =>
    //                   DialogWidget(backupInteractor: widget.backupInteractor)),
    //         );
    //         Future.delayed(const Duration(milliseconds: 500)).then((value) {
    //           return file.readAsBytes();
    //         }).then((readData) {
    //           if (isZip) {
    //             return widget.backupInteractor.restoreV2(readData);
    //           } else {
    //             return widget.backupInteractor.restore(readData);
    //           }
    //         }).then((restoreResult) {
    //           Log.i('canpop');
    //           if (Navigator.canPop(context)) {
    //             Navigator.pop(context);
    //           }
    //           file.exists().then((exist) {
    //             if (exist) {
    //               Log.i('delete');
    //               file.delete();
    //             }
    //           });
    //           if (restoreResult) {
    //             widget.appDataInteractor.requestUpdate();
    //           } else {
    //             Log.i('restore fail');
    //             showDialog(
    //               context: context,
    //               builder: (context) {
    //                 return AlertDialog(
    //                   title: const Text("Restore Error"),
    //                   content: Text(L10n.of(context)!.restoreError),
    //                   actions: <Widget>[
    //                     ElevatedButton(
    //                       child: const Text("OK"),
    //                       onPressed: () {
    //                         Navigator.pop(context);
    //                       },
    //                     ),
    //                   ],
    //                 );
    //               },
    //             );
    //           }
    //         });
    //       }
    //       //   });
    //       // }
    //     });
    //   }
    // });
  }
}
