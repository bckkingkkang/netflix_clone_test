import 'package:flutter/material.dart';
import 'package:netflix_clone_test/model/model_movie.dart';
import 'package:netflix_clone_test/widget/carousel_slider.dart';

// 상단바 + 콘텐츠 영역을 포함하는 HomeScreen 위젯

// 영화 데이터는 백엔드에서 가져오기 때문에 StatefulWidget 사용
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // 영화 더미 데이터 생성
  List<Movie> movies = [
    Movie.fromMap(
      {
        // movies 안에 들어갈 샘플 데이터
        'title' : '사랑의 불시착',
        'keyword' : '사랑/로맨스',
        'poster' : 'images/test_movie_1.png',
        'like' : false,
      }
    ) 
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return TopBar();
    // 기존 TopBar를 지우고 ListView 안에 Stack을 넣는 구조로 수정
    return ListView(children : <Widget>[
      Stack(children : <Widget>[
        // Stack의 경우 children 안에 선언한 순서대로 쌓임
        CarouselImage(movies: movies),
        TopBar(),
      ])
    ]);
  }
}

// Home 화면의 상단바 같은 경우 home 화면에서만 사용되기 때문에 별도의 위젯으로 분리하지 않음
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding : EdgeInsets.fromLTRB(20, 7, 20, 7),
      child : Row(
        // 각 항목들 사이에 동일한 간격 부여
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children : <Widget> [
          Image.asset(
            'images/Netflix_test.png', 
            fit: BoxFit.contain, 
            height: 25,
          ),
          // 텍스트 부분은 Container로 감싸서 여백 조절
          Container(
            padding : EdgeInsets.only(right : 1),
            child : Text(
              'TV 프로그램',
              style : TextStyle(fontSize : 14),
            ),
          ),
          Container(
            padding : EdgeInsets.only(right : 1),
            child : Text(
              '영화',
              style : TextStyle(fontSize : 14),
            ),
          ),
          Container(
            padding : EdgeInsets.only(right : 1),
            child : Text(
              '내가 찜한 콘텐츠',
              style : TextStyle(fontSize : 14),
            ),
          ),
        ]
      )
    );
  }
}