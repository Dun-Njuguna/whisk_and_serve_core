class Breakpoints {
  static const int xlg = 950;
  static const int lg = 860;
  static const int md = 635;
  static const int sm = 500;
  static const int floatingButton = 50;
}

int getColumnCount({required double screenWidth}) {
  if (screenWidth > Breakpoints.xlg) {
    return 5;
  } else if (screenWidth > Breakpoints.lg) {
    return 4;
  } else if (screenWidth > Breakpoints.md) {
    return 3;
  } else {
    return 2;
  }
}