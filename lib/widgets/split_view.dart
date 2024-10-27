// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:inertia/extensions/extensions.dart';

class VerticalSplitView extends StatefulWidget {
  final Widget left;
  final Widget right;
  final double ratio;

  const VerticalSplitView({
    super.key,
    required this.left,
    required this.right,
    this.ratio = 0.17,
  })  : assert(ratio >= 0),
        assert(ratio <= 1);

  @override
  _VerticalSplitViewState createState() => _VerticalSplitViewState();
}

class _VerticalSplitViewState extends State<VerticalSplitView> {
  final _dividerWidth = 16.0;

  //from 0-1
  late double _ratio;
  double? _maxWidth;

  double get _width1 => _ratio * _maxWidth!;

  double get _width2 => (1 - _ratio) * _maxWidth!;

  @override
  void initState() {
    super.initState();
    _ratio = widget.ratio;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      assert(_ratio <= 1);
      assert(_ratio >= 0);
      _maxWidth ??= constraints.maxWidth - _dividerWidth;
      if (_maxWidth != constraints.maxWidth) {
        _maxWidth = constraints.maxWidth - _dividerWidth;
      }

      return SizedBox(
        width: constraints.maxWidth,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: _width1,
              child: widget.left,
            ),
            MouseRegion(
              cursor: MaterialStateMouseCursor.clickable,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: VerticalDivider(
                  thickness: 1.5,
                  width: 1,
                  color: context.theme.dividerColor,
                ),
                onPanUpdate: (DragUpdateDetails details) {
                  // setState(() {
                  //   _ratio += details.delta.dx / _maxWidth!;
                  //   if (_ratio < 0.0) {
                  //     _ratio = 0.0;
                  //   }
                  //   if (_ratio > 0.5) {
                  //     _ratio = 0.5;
                  //     return;
                  //   }
                  // });
                },
              ),
            ),
            SizedBox(
              width: _width2,
              child: widget.right,
            ),
          ],
        ),
      );
    });
  }
}
