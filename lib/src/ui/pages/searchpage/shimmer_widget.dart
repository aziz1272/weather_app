import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      child: Shimmer.fromColors(
          baseColor: Colors.purple,
          highlightColor: Colors.grey.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 20,
                    width: 120,
                    color: Colors.grey,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 20,
                    width: 120,
                    color: Colors.grey,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 20,
                    width: 120,
                    color: Colors.grey,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 40),
                height: 80,
                width: 80,
                color: Colors.redAccent,
              ),
            ],
          )
      ),
    );
  }
}
