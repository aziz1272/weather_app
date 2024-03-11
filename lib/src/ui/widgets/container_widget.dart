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
    return Container(
        height: double.infinity,
        width: double.infinity,
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
