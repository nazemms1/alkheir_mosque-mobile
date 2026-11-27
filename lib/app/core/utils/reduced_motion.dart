import 'package:flutter/widgets.dart';

extension ReducedMotionX on AnimationController {
  /// يوقف الحركة الزخرفية المتكررة عند تفعيل "تقليل الحركة" في النظام.
  void respectReducedMotion(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) stop();
  }
}
