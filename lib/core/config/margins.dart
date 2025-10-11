import 'package:flutter/widgets.dart';

extension PaddingSize on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());

  SliverToBoxAdapter get sliverH =>
      SliverToBoxAdapter(child: SizedBox(height: toDouble()));

  SliverToBoxAdapter get sliverW =>
      SliverToBoxAdapter(child: SizedBox(width: toDouble()));
}
