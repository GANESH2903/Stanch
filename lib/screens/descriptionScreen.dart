import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share/share.dart';

class Descriptionscreen extends StatefulWidget {
  final List<String> images;
  const Descriptionscreen({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<Descriptionscreen> createState() => _DescriptionscreenState();
}

class _DescriptionscreenState extends State<Descriptionscreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Description",
          style: TextStyle(
              color: Color.fromARGB(207, 8, 68, 26),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.black12),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.38,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: PageView.builder(
                              itemCount: widget.images.length, // Number of images
                              onPageChanged: (index) {
                                setState(() {
                                  _currentIndex =
                                      index; // Update the index when a new image is swiped
                                });
                              },
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  widget.images[index],
                                  fit: BoxFit
                                      .cover, // Make sure the image fits the container
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,

                            child: _buildIndicator()),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.save_alt_outlined,
                          size: 30,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.bookmark_border_outlined,
                          size: 30,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.favorite_outline,
                          size: 30,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.qr_code_scanner,
                          size: 30,
                          color: Colors.black,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                        InkWell(
                            onTap: () {
                              Share.share('Welcome to Stanch!');
                            },
                            child: Icon(
                              Icons.share_outlined,
                              size: 30,
                              color: Colors.black,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.bookmark_border_outlined,
                    color: Colors.teal,
                  ),
                  Text("1034"),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.favorite_outline,
                    color: Colors.teal,
                  ),
                  Text("1034"),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12),
                    child: RatingBarIndicator(
                      rating: 3.2,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.lightBlueAccent,
                      ),
                      unratedColor: Colors.white,
                      itemCount: 5,
                      itemSize: 22.0,
                      direction: Axis.horizontal,
                    ),
                  ),
                  Text(
                    " 3.2",
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text("Actor Name",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(207, 8, 68, 26),
                  )),
              Text("Indian Actress",
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    "  Duration 20 Mins",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    "  Total Average Fees \u20B99,999",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("About",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(207, 8, 68, 26),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                """From cardiovascular health to fitness, flexibility, balance,stress relief, better sleep, increased cognitive performance,and more, you can reap all of these benefits in just onesession out on the waves. So, you may find yourselfwondering what are the benefits of going on a surf camp.""",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("See More",
                      style: TextStyle(fontSize: 18, color: Colors.teal))
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_all),
            label: 'Prolet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined),
            label: 'Meetup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste_search_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          )
        ],
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.images.map((image) {
        int index = widget.images.indexOf(image);
        return Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index
                ? Colors.blueAccent
                : Colors.grey,
          ),
        );
      }).toList(),
    );
  }
}
