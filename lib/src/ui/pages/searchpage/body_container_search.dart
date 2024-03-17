import 'package:flutter/material.dart';

class BodyContainerSearch extends StatelessWidget {
  const BodyContainerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    Size ssd = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      height: ssd.height * 0.058,
      width: ssd.width,
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(width: 2, color: Colors.purple),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Search for a city",
            style: TextStyle(
              color: Colors.black54,
              fontSize: ssd.height * 0.019,
            ),
          ),
          const Icon(
            Icons.search,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
