import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DicoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
          body: Container(
            child: Center(
              child: Text('Discover Page'),
            ),
          ),
        );
      },
    );
  }
}
