double responsiveIconSize(double width) {
  double iconSize = 0.0;
  if (width > 1000) {
    iconSize = 30;
  } else if (width > 700) {
    iconSize = 25;
  } else if (width > 400) {
    iconSize = 15;
  } else if (width > 200) {
    iconSize = 13;
  } else {
    iconSize = 8;
  }
  return iconSize;
}
