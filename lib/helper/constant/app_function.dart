class AppFunction {
  static double getRate(double rate) {
    if (rate <= 0) {
      return 0;
    }
    if (rate > 0 && rate <= 0.5) {
      return 0.5;
    }
    if (rate > 0.5 && rate <= 1) {
      return 1;
    }
    if (rate > 1 && rate <= 1.5) {
      return 1.5;
    }
    if (rate > 1.5 && rate <= 2) {
      return 2;
    }
    if (rate > 2 && rate <= 2.5) {
      return 2.5;
    }
    if (rate > 2.5 && rate <= 3) {
      return 3;
    }
    if (rate > 3 && rate <= 3.5) {
      return 3.5;
    }
    if (rate > 3.5 && rate <= 4) {
      return 4;
    }
    if (rate > 4 && rate <= 4.5) {
      return 4.5;
    }
    return 5;
  }
}
