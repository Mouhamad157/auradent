import 'package:responsive_sizer/responsive_sizer.dart';

extension MinMax on num {

  double get max => w > h ? w : h;

  double get min => w < h ? w : h;

  double maxSp(num x) => x > sp ? sp : x.toDouble();


}