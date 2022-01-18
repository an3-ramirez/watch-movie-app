import 'package:flutter/material.dart';
import 'package:watch_movie_app/src/ui/global_widgets/round_button.dart';
import 'package:watch_movie_app/src/ui/global_widgets/star_rating.dart';
import 'package:watch_movie_app/src/utils/custom_colors.dart';

/** Utils */
import 'package:watch_movie_app/src/utils/custom_styles.dart';
import 'package:watch_movie_app/src/utils/responsive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                print('logut user');
              },
              child: const Icon(Icons.settings, color: Colors.white54),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15),
        height: responsive.height,
        width: responsive.width,
        decoration: const BoxDecoration(color: CustomColors.black),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //_popularList(),
              _title('Popular'),
              SizedBox(
                height: responsive.hp(35),
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: _carMovie,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(right: 30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'See All >',
                    style: TextStyle(
                      fontSize: 22,
                      color: CustomColors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Divider(color: Colors.white70),
              ),
              _title('Recommendations'),
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: _carMovieVertical,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: CustomStyles.textWhite.copyWith(fontSize: 24),
      ),
    );
  }

  Widget _carMovie(context, i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _imageCard(),
        ),
        _subTitle('Game of Thrones', 150),
        StarRating(
          rating: 2.5,
          color: Colors.white54,
          size: 15,
          onRatingChanged: (rating) {},
        )
      ],
    );
  }

  Widget _carMovieVertical(context, i) {
    Responsive responsive = Responsive(context);

    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: _imageCard(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _subTitle('Game of Thrones', 200),
              StarRating(
                rating: 2.5,
                color: Colors.white54,
                size: 15,
                onRatingChanged: (rating) {},
              ),
              const SizedBox(height: 15),
              const Text(
                'IMDb: 9,4',
                style: TextStyle(color: Colors.white54),
              ),
              Row(
                children: [
                  Container(
                    height: 65,
                    width: responsive.wp(39),
                    //color: Colors.amber,
                    child: RoundButton(
                      textBtn: 'Watch Now',
                      fontWeight: FontWeight.normal,
                      paddingHorizontal: 0,
                      paddingVertical: 8,
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white54,
                      size: 40,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Container _imageCard() {
    return Container(
      margin: const EdgeInsets.only(right: 23.0),
      width: 150,
      height: 170,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/the-witcher-mobile-2.jpeg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _subTitle(String text, double width) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: width,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
