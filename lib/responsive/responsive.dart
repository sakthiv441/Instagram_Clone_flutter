import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/UitlsFolder/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webscreenLayout;
  final Widget mobilescreenLayout;
  const ResponsiveLayout(
      {Key? key,
      required this.webscreenLayout,
      required this.mobilescreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webscreenLayout;
        }
        return mobilescreenLayout;
      },
    );
  }
}
