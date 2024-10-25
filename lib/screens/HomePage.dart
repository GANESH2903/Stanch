import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stanch/screens/descriptionScreen.dart';

import 'components/popular_people.dart';
import 'components/trending_meetups.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<String> _meetingImages = [
    'assets/types-of-meetings.png',
    'assets/Virtual-Meeting.jpg',
    'assets/statistics-on-time.jpg',
  ];

  final List<String> _cardImages = [
    'assets/types-of-meetings.png',
    'assets/Virtual-Meeting.jpg',
    'assets/statistics-on-time.jpg',
    'assets/types-of-meetings.png',
    'assets/Virtual-Meeting.jpg',
  ];

  final List<String> _trendingMeetups = [
    'assets/meetup.jpg',
    'assets/meetup1.jpg',
    'assets/meetup4.jpg',
    "assets/meetup3.jpg",
    'assets/types-of-meetings.png',
  ];
  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _meetingImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Individual Meetup" , style: TextStyle(color: Color.fromARGB(207, 8, 68, 26), fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.06,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(207, 8, 68, 26), width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.search),
                        Text(" Search" , style: TextStyle(color: Colors.grey , fontSize: 16),)
                      ],
                    ),
                    Icon(Icons.mic)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _meetingImages.length,
                  itemBuilder: (context, index) {
                    return _buildBannerCard(_meetingImages[index]);
                  },
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              ),
              _buildIndicator(),
              SizedBox(height: 22,),
              const Text("Trending Popular People" ,style: TextStyle(color: Color.fromARGB(207, 8, 68, 26),fontSize: 18 ,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PopularPeopleCard(
                      title: "Author-1",
                      images: _cardImages,
                      memberCount: "1,028",
                      icon: Icon(
                        Icons.energy_savings_leaf,
                        color: Color.fromARGB(207, 8, 68, 26),
                        size: 24,
                      ),
                    ),
                    PopularPeopleCard(
                      title: "Author-2",
                      images: _cardImages,
                      memberCount: "975",
                      icon: Icon(
                        Icons.energy_savings_leaf_outlined,
                        color: Color.fromARGB(207, 8, 68, 26),
                        size: 24,
                      ),
                    ),PopularPeopleCard(
                      title: "Author-3",
                      images: _cardImages,
                      memberCount: "2,455",
                      icon: Icon(
                        Icons.energy_savings_leaf_sharp,
                        color: Color.fromARGB(207, 8, 68, 26),
                        size: 24,
                      ),
                    ),PopularPeopleCard(
                      title: "Author-4",
                      images: _cardImages,
                      memberCount: "1,200",
                      icon: Icon(
                        Icons.energy_savings_leaf_outlined,
                        color: Color.fromARGB(207, 8, 68, 26),
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22,),
              const Text("Top Trending Meetups" ,style: TextStyle(color: Color.fromARGB(207, 8, 68, 26),fontSize: 18 ,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TrendingMeetsupsCard(
                      image: _trendingMeetups[0],
                      press: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Descriptionscreen(images: _trendingMeetups,)));
                      }
                    ),
                    TrendingMeetsupsCard(
                        image: _trendingMeetups[1],
                        press: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Descriptionscreen(images: _trendingMeetups,)));
                        }
                    ),
                    TrendingMeetsupsCard(
                        image: _trendingMeetups[2],
                        press: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Descriptionscreen(images: _trendingMeetups,)));
                        }
                    ),TrendingMeetsupsCard(
                        image: _trendingMeetups[3],
                        press: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Descriptionscreen(images: _trendingMeetups,)));
                        }
                    ),
                    TrendingMeetsupsCard(
                        image: _cardImages[0],
                        press: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Descriptionscreen(images: _trendingMeetups,)));
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildBannerCard(String image) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _meetingImages.map((image) {
        int index = _meetingImages.indexOf(image);
        return Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index
                ? Colors.blueAccent
                : Colors.grey.withOpacity(0.3),
          ),
        );
      }).toList(),
    );
  }
}
