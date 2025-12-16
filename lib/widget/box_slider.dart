import 'package:flutter/material.dart';
import 'package:netflix_clone_test/model/model_movie.dart';
import 'package:netflix_clone_test/screen/detail_screen.dart';

// 상태변화가 없기 때문에 StatelessWidget 사용
class BoxSlider extends StatelessWidget {

  // 기본 구조 작성 후 home_screen.dart에서 movies를 넘겨받아야 한다.
  late final List<Movie> movies;
  // 생성자 초기화
  BoxSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : EdgeInsets.all(7),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : <Widget> [
          Text('지금 뜨는 콘텐츠'),
          Container(
            height : 120,
            child : ListView(
              scrollDirection: Axis.horizontal,
              children : makeBoxImages(movies, context),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(List<Movie> movies, BuildContext context) {
  List<Widget> results = [];

  for(var i = 0; i<movies.length; i++) {
    results.add(
      InkWell(
        onTap : () {
          Navigator.of(context).push(MaterialPageRoute<Null>(
            fullscreenDialog: true, 
            builder : (BuildContext context) {
              return DetailScreen(
                  movie : movies[i],
              );
            }
          ));
        },
        child : Container(
          padding : EdgeInsets.only(right : 10),
          child : Align(
            alignment: Alignment.centerLeft,
            child : Image.asset(movies[i].poster),
          )
        ),
      )
    );
  }
  return results;
}