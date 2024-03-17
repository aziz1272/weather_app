import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  var onpressed;
  NavigatorButton({
    required this.onpressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Size ssd = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: 40,
        width: ssd.width * 0.33,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.purple,
              width: 2,
            )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.location_on_outlined, color: Colors.green.shade900,),
            Text("location",style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
          ],
        ),
      ),
    );
  }
}
