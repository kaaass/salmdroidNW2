class WinLose {
  int win = 0;
  int lose = 0;

  WinLose operator +(WinLose other) {
    WinLose ret = this;
    ret.win += other.win;
    ret.lose += other.lose;
    return ret;
  }
}
