import 'package:flutter/material.dart';

class AppShadow{
  static const BoxShadow appShadowNormal = BoxShadow(color: Colors.black26 , blurRadius: 5);
  static const BoxShadow appShadowWithOffset = BoxShadow(color: Colors.black26 , blurRadius: 5,offset: Offset(0,5));
  static const BoxShadow buttonShadow = BoxShadow(
      color: Color(0x29D61439),
      blurRadius: 6,
      //offset: Offset(0, 3)
  );

}