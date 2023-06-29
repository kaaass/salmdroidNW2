enum BackupType {
  check,
  backup,
  restore,
}

class BackupStatus {
  late BackupType type;
  late int now;
  late int shiftsNum;
  late int resultsNum;

  BackupStatus() {
    type = BackupType.backup;
    now = 0;
    shiftsNum = 0;
    resultsNum = 0;
  }
}
