import 'package:flutter/material.dart';
import '../../widgets/color_widgets.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 5),
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: ColorWidgets.purple_shade400,
        border: Border.all(width: 2, color: Colors.purple),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
        child: Text(
          "Search",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
