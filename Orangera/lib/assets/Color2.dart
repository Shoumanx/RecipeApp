import 'package:flutter/material.dart';


final Color Primary = Color(0xff6F8FEA);
final Color Secondary = Color(0xff2F2F51);
final Color Background = Color(0xffF5F5FF);

final Color White = Color(0xffffffff);
final Color Highlight = Color(0xffEBEBFF);


final Color CardBG = Color(0xffF5F6FA);
final Color CardIMG = Color(0xffE8ECFF);
final Color Tile = Color(0xff474AD9);
final Color Subtitle = Color(0xff9797A8);

final LinearGradient GR = LinearGradient(
  colors: [Color(0xffFEB497),Color(0xffF96C7C)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final LinearGradient HideU = LinearGradient(
  colors: [Background,Background.withAlpha(0)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

final LinearGradient HideD = LinearGradient(
  colors: [Background,Background.withAlpha(0)],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);