import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularPeopleCard extends StatelessWidget {
  final String title;
  final String memberCount;
  final List<String> images;
  final Icon icon;

  const PopularPeopleCard({
    Key? key,
    required this.title,
    required this.memberCount,
    required this.images,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      width: MediaQuery.of(context).size.width * 0.75,
      margin: EdgeInsets.only(left: 8 , right: 8),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(207, 8, 68, 26), width: 1.7)),
                padding: EdgeInsets.all(8),
                child: icon
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(207, 8, 68, 26)),
                  ),
                  Text(
                    '$memberCount Members',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 16,
            thickness: 1,
            color: Colors.grey,
          ),
          SizedBox(height: 8,),
          SizedBox(
            height: 40,
            child: Stack(
              children: List.generate(images.length, (index) {
                return Positioned(
                  left: index *
                      30.0,
                  child: ClipOval(
                    child: Image.asset(
                      images[index],
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color.fromARGB(255, 0, 101, 153)),
                child: Center(
                  child: Text(
                    "See More",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
