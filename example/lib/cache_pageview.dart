import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MyViewPort extends RenderSliverFillViewport {
  int? itemCount;

  MyViewPort(
      {required RenderSliverBoxChildManager childManager,
      double viewportFraction = 1.0,
      this.itemCount,})
      : super(childManager: childManager, viewportFraction: viewportFraction);

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset, double itemExtent) {
    return min(
        super.getMaxChildIndexForScrollOffset(scrollOffset, itemExtent) + 2,
        itemCount! - 1,);
  }

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! SliverMultiBoxAdaptorParentData) {
      child.parentData = SliverMultiBoxAdaptorParentData()..keepAlive = true;
    }
  }
}

class MySliverFillViewport extends SliverMultiBoxAdaptorWidget {
  /// Creates a sliver whose box children that each fill the viewport.
  //
  const MySliverFillViewport(
      {Key? key,
      required SliverChildDelegate delegate,
      this.viewportFraction = 1.0,
      this.itemCount,})
      : assert(viewportFraction > 0.0),
        super(key: key, delegate: delegate);

  /// The fraction of the viewport that each child should fill in the main axis.
  ///
  /// If this fraction is less than 1.0, more than one child will be visible at
  /// once. If this fraction is greater than 1.0, each child will be larger than
  /// the viewport in the main axis.
  final double viewportFraction;

  final int? itemCount;

  @override
  RenderSliverFillViewport createRenderObject(BuildContext context) {
    final SliverMultiBoxAdaptorElement element =
        context as SliverMultiBoxAdaptorElement;
    return MyViewPort(
        childManager: element,
        itemCount: itemCount,
        viewportFraction: viewportFraction,);
  }

  @override
  SliverMultiBoxAdaptorElement createElement() {
    return SliverMultiBoxAdaptorElement(this);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderSliverFillViewport renderObject,) {
    renderObject.viewportFraction = viewportFraction;
  }
}

const PageScrollPhysics _kPagePhysics = PageScrollPhysics();

class Ext extends PageView {
  Ext({Key? key}) : super(key: key);
}

class MyPageView extends StatelessWidget {
  final SliverChildListDelegate childrenDelegate;
  final PageController controller = PageController();

  MyPageView({Key? key, required List<Widget> children})
      : childrenDelegate = SliverChildListDelegate(children),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      axisDirection: AxisDirection.right,
      controller: controller,
      physics: _kPagePhysics,
      viewportBuilder: (BuildContext context, ViewportOffset position) {
        debugPrint(position.toString());
        return Viewport(
          cacheExtent: 300.0,
          axisDirection: AxisDirection.right,
          offset: position,
          slivers: <Widget>[
            MySliverFillViewport(
                itemCount: 10,
                delegate: childrenDelegate,),
          ],
        );
      },
    );
  }
}
