import 'package:flutter/material.dart';
import 'package:netflix_clone_test/model/model_movie.dart';
import 'package:netflix_clone_test/screen/detail_screen.dart';

// 상태변화가 없기 때문에 StatelessWidget 사용
class CircleSlider extends StatelessWidget {

  // 기본 구조 작성 후 home_screen.dart에서 movies를 넘겨받아야 한다.
  late final List<Movie> movies;
  // 생성자 초기화
  CircleSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : EdgeInsets.all(7),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('미리보기'),
          Container(
            height: 120,
            // 리스트 뷰 작성
            child : ListView(
              scrollDirection: Axis.horizontal, // 가로 방향 스크롤
              // 실제적인 위젯들을 만드는 부분 - 별도의 함수로 분리
              children : makeCircleImages(movies, context),
            ),
          ),
        ],
      )
    );
  }
}

List<Widget> makeCircleImages(List<Movie> movies, BuildContext context) {
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
          padding : EdgeInsets.only(right:30),
          child : Align(
            alignment:Alignment.centerLeft,
            child : CircleAvatar(
              backgroundImage : NetworkImage(movies[i].poster),
              radius : 48,
            )
          )
        )
      )
    );
  }
  return results;
}