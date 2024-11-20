import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigateConst {
  static const duration = Duration(milliseconds: 500);
  static const transition = Transition.native;
  static const transitionLTR = Transition.leftToRightWithFade;
  static const transitionRTL = Transition.rightToLeft;
  static const transitionDTU = Transition.downToUp;
}

extension Consts on GetPage {
  GetPage get applyConsts => copy(
        transition: transition ?? NavigateConst.transitionRTL,
        transitionDuration: transitionDuration ?? NavigateConst.duration,
      );
}
