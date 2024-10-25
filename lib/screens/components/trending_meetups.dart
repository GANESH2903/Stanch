import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingMeetsupsCard extends StatelessWidget {
  final String image;
  final VoidCallback press;

  const TrendingMeetsupsCard({
    Key? key,
    required this.image,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        width: MediaQuery.of(context).size.width * 0.47,
        height: MediaQuery.of(context).size.height * 0.32,
        margin: EdgeInsets.only(left: 8, right: 8),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
          image,
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
