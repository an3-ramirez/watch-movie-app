import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:watch_movie_app/src/ui/global_widgets/star_rating.dart';

import '../../global_widgets/round_button.dart';

final List<dynamic> movieList = [
  {
    'title': 'Coffee',
    'image':
        'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg'
  },
  {
    'title': 'Bread',
    'image':
        'https://cdn.pixabay.com/photo/2016/11/18/19/00/breads-1836411_1280.jpg'
  },
  {
    'title': 'Gelato',
    'image':
        'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg'
  },
  {
    'title': 'Ice Cream',
    'image':
        'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg'
  }
];

class SeriePage extends StatefulWidget {
  const SeriePage({Key? key}) : super(key: key);

  @override
  _SeriePageState createState() => _SeriePageState();
}

class _SeriePageState extends State<SeriePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 360,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              autoPlay: false,
              // enlargeCenterPage: true,
              //scrollDirection: Axis.vertical,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
            ),
            items: movieList
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      elevation: 6.0,
                      shadowColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              item['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          Text(movieList[_currentIndex]['title'],
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Center(
              child: SizedBox(
            width: 125,
            child: StarRating(
                color: Colors.grey, rating: 4.0, onRatingChanged: (rating) {}),
          )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'IMDb: 8,4',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: 250,
            child: RoundButton(
              textBtn: 'Watch Now',
              color: Colors.yellow,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
