import 'package:flutter/widgets.dart';

extension DesignExtension on num {
  /// Vertical spacing: SizedBox(height: toDouble())
  Widget get verticalSpace => SizedBox(height: toDouble());

  /// Horizontal spacing: SizedBox(width: toDouble())
  Widget get horizontalSpace => SizedBox(width: toDouble());

  /// Sliver vertical spacing
  Widget get sliverVerticalSpace => SliverToBoxAdapter(child: SizedBox(height: toDouble()));

  /// Sliver horizontal spacing
  Widget get sliverHorizontalSpace => SliverToBoxAdapter(child: SizedBox(width: toDouble()));

  /// Circular border radius
  BorderRadius get radius => BorderRadius.circular(toDouble());

  /// All sides edge insets
  EdgeInsets get allPadding => EdgeInsets.all(toDouble());

  /// Horizontal padding
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: toDouble());

  /// Vertical padding
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());
}
