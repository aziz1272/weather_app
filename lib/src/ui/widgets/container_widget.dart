import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  Widget child_widget;
   ContainerWidget({
     // ignore: non_constant_identifier_names
     required this.child_widget,
     super.key
   });

  @override
  Widget build(BuildContext context) {
    Size ssd = MediaQuery.of(context).size;
    return Container(
        height: ssd.height,
        width: ssd.width,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.purple.shade400, Colors.deepPurple],
    ),
    ),
      child: child_widget,
    );
  }
}
